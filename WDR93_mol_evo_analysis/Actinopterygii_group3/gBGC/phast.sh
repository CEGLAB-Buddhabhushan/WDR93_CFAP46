#!/bin/bash

j=$1
tree="$j".nwk
i="$j".aln

phyloFit --tree $tree --subst-mod HKY85 --out-root $i $i
for k in `cat $i|grep "^>" $i | sed 's/>//g'`
do
phastBias --bgc 3 --output-tracts $i.gff $i $i.mod $k > $k.wig
sed '1d' $k.wig > $k.a
sed "1s/^/$k\n/" $k.a > $k.b
rm $k.wig $k.a
done
touch tempB
for k in `ls -1 *.b`
do
paste $k tempB > $i.phast.out
mv $i.phast.out tempB
done
mv tempB $i.phast.out
rm *.b

