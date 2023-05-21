clade=$1
cd $clade
mkdir gBGC
cp "$clade".aln "$clade".nwk gBGC
cd gBGC

cp ../../scripts/* .
chmod 777 mapnh.sh phast.sh
./mapnh.sh "$clade"
./phast.sh "$clade"
chmod 777 script.sh gBGC.R transpose.sh ploting.sh
size=`wc -l "$clade"|cut -d' ' -f1`
./script.sh $size "$clade" "$clade".aln.phast.out
rm "$clade" "$clade".aln.phast.out
for i in `ls *_phastout`
do 
./transpose.sh $i >a
mv a $i 
done
rename 's/.aln.phast.out/_phastout/g' *.out
mv "$clade"_group1 $clade
mv "$clade"_group1_phastout "$clade"_phastout
./ploting.sh

cd ../..
