#!/bin/bash -f
rm -f group_file
folder="." 
N=72
for i in `seq 1 $N`; do
        sed "s/XXXXX/$RANDOM/g" template > $i.in
        if [ $i -le 36 ]; then
             name="${folder}/reac.rst"
        else
             name="${folder}/prod.rst"
        fi
        echo "-O -rem 0 -i ${folder}/${i}.in -o ${folder}/$i.out  -c $name -r ${folder}/$i.rst -x ${folder}/$i.nc -inf ${folder}/$i.mdinfo -p ${folder}/Mpro-4wi_solvated.prmtop" >> group_file
done

echo "N REPLICAS  = $i"
