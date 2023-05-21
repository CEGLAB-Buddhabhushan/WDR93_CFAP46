for i in `ls -1 *_phastout`
do
mapn=`echo $i|sed 's/_phastout//g'`
Rscript gBGC.R $mapn
done
