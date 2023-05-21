##calculating the weak to strong(AT>GC) and strong to weak (GC>AT) conversion using mapnh.

j=$1
tree="$j".nwk

for i in "$j".aln
do
j=`echo $i|cut -d. -f1`
mapnh map.type=GC output.counts.tree.prefix=all_gc.prefix2 input.sequence.file=$i input.tree.file=$tree test.branch=1 test.global=1 model=K80
cat mapping_counts_per_type_AT-\>CG.dnd |tr "," "\n" |sed 's/(//g' |sed 's/).*//g' |sed 's/:/\t/g' > at2gc.1
cat mapping_counts_per_type_CG-\>AT.dnd |tr "," "\n" |sed 's/(//g' |sed 's/).*//g' |sed 's/:/\t/g' > gc2at.1
paste gc2at.1 at2gc.1 > $i.ratio.2
sort -k1,1 $i.ratio.2 > $i.ratio.2.final

## calculating dn and ds values separatly by hyphymp
#1. make input file for newconfig (which is the config file for hyphymp)
cat $i $tree > $i.input
pwd > pa
p=`cat pa`
echo $p
sed 's:path:'$p':g' newconf > $i.newconf
sed -i 's/input/'$i'\.input/g' $i.newconf

HYPHYMP dNdS.bf < $i.newconf > dnds_hyphy_result

grep -A1 "dN tree" dnds_hyphy_result > dn_hyphy_tree
grep -A1 "dS tree" dnds_hyphy_result > ds_hyphy_tree

sed '1d' dn_hyphy_tree | tr "," "\n" |sed 's/(//g' |sed 's/).*//g' |sed 's/:/\t/g' |awk '{print $1,$2}' |sed 's/ /\t/g' > dn_hyphy_tree.1
sed '1d' ds_hyphy_tree | tr "," "\n" |sed 's/(//g' |sed 's/).*//g' |sed 's/:/\t/g' |awk '{print $1,$2}' |sed 's/ /\t/g' > ds_hyphy_tree.1

paste dn_hyphy_tree.1 ds_hyphy_tree.1 > dnds_tree_hyphy.result
sort -k1,1 dnds_tree_hyphy.result > dnds_tree_hyphy.result.final
##calculating the dn and ds values by codeml
sed  "s/aln/$i/g" codeml1 > codeml.ctl
sed  -i "s/bestTree/$tree/g" codeml.ctl
sed -i "s/output_file/$i.out/g" codeml.ctl
codeml codeml.ctl
grep -A1 "dN tree" $i.out > dn_paml_tree
grep -A1 "dS tree" $i.out > ds_paml_tree

sed '1d' dn_paml_tree | tr "," "\n" |sed 's/(//g' |sed 's/).*//g' |sed 's/:/\t/g' |awk '{print $1,$2}' |sed 's/ /\t/g' > dn_paml_tree.1
sed '1d' ds_paml_tree | tr "," "\n" |sed 's/(//g' |sed 's/).*//g' |sed 's/:/\t/g' |awk '{print $1,$2}' |sed 's/ /\t/g' > ds_paml_tree.1
paste dn_paml_tree.1 ds_paml_tree.1 > dnds_paml_tree.result
sort -k1,1 dnds_paml_tree.result > dnds_paml_tree.result.final

#merging the result of hyphy and codeml in single file.
paste $i.ratio.2.final dnds_tree_hyphy.result.final dnds_paml_tree.result.final > $j
done
