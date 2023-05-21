for query in *.fa
do
q_sp=`echo $query|sed 's/\.fa//g'`
cd /home/neo/bird_db1
for i in `cat list_anseriformes_in_bird_db1_SRA|sort -u`
do
cd $i
echo $i
SRA_db=`ls *.nal|sed 's/\.nal//g'`

species_name=`echo $i`


blastn -task blastn -evalue 0.05 -max_target_seqs 5000 -db $SRA_db -out /home/neo/bird_db1/buddha/CFAP46/blast_output_SRA_1/blastn."$q_sp"."$species_name".SRA.anseriformes.1out -num_threads 4 -outfmt 1 -query /home/neo/bird_db1/buddha/CFAP46/query/$query
blastn -task blastn -evalue 0.05 -max_target_seqs 5000 -db $SRA_db -out /home/neo/bird_db1/buddha/CFAP46/blast_output_SRA_xml/blastn."$q_sp"."$species_name".SRA.anseriformes.xml -num_threads 4 -outfmt 5 -query /home/neo/bird_db1/buddha/CFAP46/query/$query
echo -e $species_name"\t"$SRA_db

cd ..
done

cd /media/neo/5e4dad81-4707-4b68-ac02-d35a20881d06/home/ceglab26/sagar/bird_database
for i in `cat list_anseriformes_in_bird_database_SRA|sort -u`
do
cd $i
echo $i
SRA_db=`ls *.nal|sed 's/\.nal//g'`

species_name=`echo $i`


blastn -task blastn -evalue 0.05 -max_target_seqs 5000 -db $SRA_db -out /home/neo/bird_db1/buddha/CFAP46/blast_output_SRA_1/blastn."$q_sp"."$species_name".SRA.anseriformes.1out -num_threads 4 -outfmt 1 -query /home/neo/bird_db1/buddha/CFAP46/query/$query
blastn -task blastn -evalue 0.05 -max_target_seqs 5000 -db $SRA_db -out /home/neo/bird_db1/buddha/CFAP46/blast_output_SRA_xml/blastn."$q_sp"."$species_name".SRA.anseriformes.xml -num_threads 4 -outfmt 5 -query /home/neo/bird_db1/buddha/CFAP46/query/$query
echo -e $species_name"\t"$SRA_db

cd ..
done

cd /media/neo/5e4dad81-4707-4b68-ac02-d35a20881d06/home/ceglab26/sagar/bird_database/galliforms_database
for i in `cat list_galliformes_25_in_bird_database_galliforms_database_SRA|sort -u`
do
cd $i
echo $i
SRA_db=`ls *.nal|sed 's/\.nal//g'`

species_name=`echo $i`


blastn -task blastn -evalue 0.05 -max_target_seqs 5000 -db $SRA_db -out /home/neo/bird_db1/buddha/CFAP46/blast_output_SRA_1/blastn."$q_sp"."$species_name".SRA.galliformes.1out -num_threads 4 -outfmt 1 -query /home/neo/bird_db1/buddha/CFAP46/query/$query
blastn -task blastn -evalue 0.05 -max_target_seqs 5000 -db $SRA_db -out /home/neo/bird_db1/buddha/CFAP46/blast_output_SRA_xml/blastn."$q_sp"."$species_name".SRA.anseriformes.xml -num_threads 4 -outfmt 5 -query /home/neo/bird_db1/buddha/CFAP46/query/$query
echo -e $species_name"\t"$SRA_db

cd ..
done
cd /home/neo/bird_db1
for i in Calidris_pugnax Calypte_anna
do
cd $i
echo $i
SRA_db=`ls *.nal|sed 's/\.nal//g'`

species_name=`echo $i`


blastn -task blastn -evalue 0.05 -max_target_seqs 5000 -db $SRA_db -out /home/neo/bird_db1/buddha/CFAP46/blast_output_SRA_1/blastn."$q_sp"."$species_name".SRA.neoaves.1out -num_threads 4 -outfmt 1 -query /home/neo/bird_db1/buddha/CFAP46/query/$query
blastn -task blastn -evalue 0.05 -max_target_seqs 5000 -db $SRA_db -out /home/neo/bird_db1/buddha/CFAP46/blast_output_SRA_xml/blastn."$q_sp"."$species_name".SRA.anseriformes.xml -num_threads 4 -outfmt 5 -query /home/neo/bird_db1/buddha/CFAP46/query/$query
echo -e $species_name"\t"$SRA_db

cd ..
done

cd /media/neo/5e4dad81-4707-4b68-ac02-d35a20881d06/home/ceglab26/sagar/bird_database
for i in Acanthisitta_chloris Colius_striatus
do
cd $i
echo $i
SRA_db=`ls *.nal|sed 's/\.nal//g'`

species_name=`echo $i`



blastn -task blastn -evalue 0.05 -max_target_seqs 5000 -db $SRA_db -out /home/neo/bird_db1/buddha/CFAP46/blast_output_SRA_1/blastn."$q_sp"."$species_name".SRA.neoaves.1out -num_threads 4 -outfmt 1 -query /home/neo/bird_db1/buddha/CFAP46/query/$query
blastn -task blastn -evalue 0.05 -max_target_seqs 5000 -db $SRA_db -out /home/neo/bird_db1/buddha/CFAP46/blast_output_SRA_xml/blastn."$q_sp"."$species_name".SRA.anseriformes.xml -num_threads 4 -outfmt 5 -query /home/neo/bird_db1/buddha/CFAP46/query/$query
echo -e $species_name"\t"$SRA_db

cd ..
done

cd /home/neo/bird_db1/buddha/CFAP46/
done
