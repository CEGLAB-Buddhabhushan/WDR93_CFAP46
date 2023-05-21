clade=$1
# to remove internode labels from the TimeTree nwk file
for i in "$clade".nwk
do
sed -e "s/'[^()]*'//g" $i > temp.nwk
mv temp.nwk $i
echo 'library(ape)' > tree_script.r
echo "a<-read.tree(\"$i\")" >> tree_script.r
echo 'b<-unroot(a)' >> tree_script.r
echo "write.tree(b,\"$i.tree\")" >> tree_script.r
Rscript tree_script.r
mv $i.tree $i
done

# This script check whether the species name in the fasta file and nwk file are same or not.
for i in "$clade".fa
do
grep ">" $i|sed 's/>//g' > $i.txt
j="$clade".nwk
sed 's/(/\n/g' $j|sed 's/)/\n/g' |sed 's/;/\n/g' |sed 's/:/\n/g' |sed 's/,/\n/g' |grep "^[A-Z]" > $j.txt
echo $j
cat $i.txt $j.txt |sort|uniq -c |awk '$1<2 {print $2}'
rm *.txt
done

guidance=/home/ceglab358/BUDDHA/Tools/guidance.v2.02/www/Guidance/guidance.pl
for i in `ls "$clade".fa`
do
j=`echo $i|sed 's/.fa//g'`
perl $guidance --program GUIDANCE --seqFile "$i" --msaProgram PRANK --seqType codon --outDir "$i".100_PRANK --genCode 1 --bootstraps 100 --proc_num 16
cp "$i".100_PRANK/MSA.PRANK.aln.With_Names "$j".aln
rm -r "$i".100_PRANK
done
