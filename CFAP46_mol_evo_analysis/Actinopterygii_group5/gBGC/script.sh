##This script take the length of the file and ask for group size and file name as input
##e.g. script.sh 9 Birds phastoutfilename##
##please mention the name of phastout filename also as that will be  the input filename for transpose.sh

dif=$1
filename=$2
phastoutfile=$3
i=1
./transpose.sh $phastoutfile > phastout_transpose.out
last=`wc -l $filename|awk '{print $1}'`
remainder=$((last%dif))
for len in `seq $dif $dif $last`
do
head -n"$len" $filename|tail -n"$dif" > "$filename"_group"$i"
awk '{print $1}' "$filename"_group"$i" > "$filename"_species"$i"
for sp in `cat "$filename"_species"$i"`
do
grep "$sp" phastout_transpose.out >> "$filename"_group"$i"_phastout
done
i=`expr $i + 1`
done
tail -n"$remainder" $filename > "$filename"_grouplast
awk '{print $1}' "$filename"_grouplast > "$filename"_specieslast
for sp in `cat "$filename"_specieslast`
do
grep "$sp" phastout_transpose.out >> "$filename"_grouplast_phastout
done
for i in `ls -1 *_phastout`
do
mapn=`echo $i|sed 's/_phastout//g'`
Rscript gBGC.R $mapn
done

