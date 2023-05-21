clade=$1
cd $clade
mkdir codeml
cp "$clade".aln "$clade".nwk codeml
cd codeml

cp ../../scripts/demo.ctl .


## For making alingment file into two line fasta file
for i in `ls *.aln`
do
sed -e '/^>/s/$/@/' -e 's/^>/#/' $i | tr -d '\n' |sort| tr "#" "\n" | tr "@" "\t"| sed -e 's/^/>/'|sed '1d' -|sed 's/\t/\n/g' > $i.faa
done

## For taking one species as a foregorund and rest as background
echo -e "2\tF3x4" > cffile
echo -e "1\tF1x4" >> cffile
echo -e 'M0\t0\t0\t0.4\nbfree\t2\t0\t0.4\nbneutral\t2\t1\t1' > model_details

## labelling foreground species in tree and running branch model using PAML.
tree=`ls *.nwk`
align=`ls *.faa`
for i in `grep ">" *.aln.faa |sed 's/>//g'`
do
sed "s/$i/$i #1/g" "$tree" > "$i".nwk
for m in M0 bfree bneutral
do
for cf in F3x4 F1x4
do
CF=`grep "$cf" cffile|cut -f1`
x=`echo "$i"_"$cf"_"$m"`
cp demo.ctl "$x".ctl
sed -i "s/ssssss/$align/g" $x.ctl
sed -i "s/tttttt/$i.nwk/g" $x.ctl
sed -i "s/CF/$CF/g" $x.ctl
sed -i "s/oooooo/$x.out/g" $x.ctl
mdl=`grep "$m" model_details|awk '{print $2}'`
FO=`grep "$m" model_details|awk '{print $3}'`
OMG=`grep "$m" model_details|awk '{print $4}'`
sed -i "s/mdl/$mdl/g" $x.ctl
sed -i "s/FO/$FO/g" $x.ctl
sed -i "s/OMG/$OMG/g" $x.ctl
codeml $x.ctl
done
done
done

#############################################################
echo  "clade mdl fgspecies bgspecies om0 lnlm0 npm0 ombnfg ombnbg lnlbn npbn ombffg ombfbg lnlbf npbf" |sed 's/ /\t/g' > compiled_result.txt

ls *M0.out|sed 's/_F.*//g'|sort -u > speciesnames
for sp in `cat speciesnames`
do
for cf in F1x4 F3x4
do
for m0 in `ls "$sp"_"$cf"_M0.out`
do
mdl=`grep "Codon frequency model:" $m0|awk -F ":" '{print $2}'|awk '{print $1}'`
om0=`grep "(dN/dS)" $m0|awk '{print $4}'`
lnlm0=`grep "lnL" $m0|awk '{print $4}' FS=':'|awk '{print $1}' FS=')'|awk '{print $1}'`
npm0=`grep "lnL" $m0|awk '{print $3}' FS=':'|awk '{print $1}' FS=')'|awk '{print $1}'`
done
for bfree in `ls "$sp"_"$cf"_bfree.out`
do
ombffg=`grep "(dN/dS)" $bfree|awk '{print $6}'`
ombfbg=`grep "(dN/dS)" $bfree|awk '{print $5}'`
lnlbf=`grep "lnL" $bfree|awk '{print $4}' FS=':'|awk '{print $1}' FS=')'|awk '{print $1}'`
npbf=`grep "lnL" $bfree|awk '{print $3}' FS=':'|awk '{print $1}' FS=')'|awk '{print $1}'`
done
for bneutral in `ls "$sp"_"$cf"_bneutral.out`
do
ombnfg=`grep "(dN/dS)" $bneutral|awk '{print $6}'`
ombnbg=`grep "(dN/dS)" $bneutral|awk '{print $5}'`
lnlbn=`grep "lnL" $bneutral|awk '{print $4}' FS=':'|awk '{print $1}' FS=')'|awk '{print $1}'`
npbn=`grep "lnL" $bneutral|awk '{print $3}' FS=':'|awk '{print $1}' FS=')'|awk '{print $1}'`
bgspecies=`grep -A1 "w ratios as labels for TreeView" $bneutral|tail -n1|sed -e 's/(/\n/g' -e 's/)/\n/g' -e 's/,/\n/g'|grep "[A-Z]"|awk '{print $1"\t"$2}'|sed 's/#/\t/g'|awk '$2!=1{print $1}'|tr '\n' ','|sed 's/,$/\n/g'`
fgspecies=`grep -A1 "w ratios as labels for TreeView" $bneutral|tail -n1|sed -e 's/(/\n/g' -e 's/)/\n/g' -e 's/,/\n/g'|grep "[A-Z]"|awk '{print $1"\t"$2}'|sed 's/#/\t/g'|awk '$2==1{print $1}'`
done
echo "$clade $mdl $fgspecies $bgspecies $om0 $lnlm0 $npm0 $ombnfg $ombnbg $lnlbn $npbn $ombffg $ombfbg $lnlbf $npbf" |sed 's/ /\t/g'  >> compiled_result.txt
done
done
########
echo 'b<-read.table("compiled_result.txt",header=F,skip=1,sep="\t")' > likelihood.r
echo 'd<-as.data.frame(matrix(ncol = 15, nrow = 0))' >> likelihood.r

echo 'colnames(d)<-colnames(b)' >> likelihood.r
echo 'l=dim(b)[1]' >> likelihood.r
echo 'for (i in seq (1,l,1)){' >> likelihood.r
echo 'c=b[i,]' >> likelihood.r
echo 'c$pvalm0_bfree<-pchisq(2*(c$V14-c$V6),df=c$V15-c$V7,lower.tail=F)' >> likelihood.r
echo 'c$pavalbne_bfree<-pchisq(2*(c$V14-c$V10),df=c$V15-c$V11,lower.tail=F)' >> likelihood.r
echo 'd<-rbind(d,c)' >> likelihood.r
echo '}' >> likelihood.r
echo 'write.table(d,file="Final_result.txt",quote=F,sep="\t",col.names=F,row.names=F)' >> likelihood.r

Rscript likelihood.r


cd ../..




