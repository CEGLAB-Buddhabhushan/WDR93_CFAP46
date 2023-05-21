##generate FEL output using HYPHY
clade=$1
cd $clade
mkdir FEL
cp "$clade".aln "$clade".nwk FEL
cd FEL
tree="$clade".nwk
for i in "$clade".aln
do
t=`grep ">" $i|wc -l`
grep ">" $i|sed 's/>//g' > taxlist.txt
for j in `cat taxlist.txt`
do
sed "s/$j/$j{fg}/g" $tree > "$j"_treeLabled.txt
echo -e  "1\n2\n1\n"$PWD"/$i\n"$PWD"/"$j"_treeLabled.txt\n5\n1\n0.1" > "$j"_tree.config
HYPHYMP<"$j"_tree.config > "$j"_treeoutput_fel
done
done



##makking table
mkdir FEL_output
echo -e "Codon\tPartition\talpha\tbeta\tLRT\tSelection\tpValue\tSpecies" > HYPHY_FEL_merged_data.tsv
for i in *_treeoutput_fel
do
species=`echo $i|sed 's/_treeoutput_fel//g'`
echo $species
awk '/### For partition/,0' $i|awk 'BEGIN { FS="|"; OFS="\t" } NR>2'|grep -v "###"|sed 's/:--------------://g;s/|/\t/g;s/ //g;s/:-----------------://g;s/p = //g;s/\t//1;s/Selectiondetected?/Selection/g;s/Neg./Negative/g;s/Pos./Positive/g;s/p=/\t/g'|grep "\S" > "$species".tsv

awk -v species="$species" 'BEGIN{OFS="\t"; print "Codon\tPartition\talpha\tbeta\tLRT\tSelection\tpValue\tSpecies"} NR>1{$8=species; print}' "$species".tsv > "$species"_with_species.tsv

cat "$species"_with_species.tsv|awk 'NR>1' >> HYPHY_FEL_merged_data.tsv
rm "$species".tsv
mv "$species"_with_species.tsv FEL_output 
done
cd ../..
