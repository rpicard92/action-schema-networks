#! /bin/bash

function make_wargame {
   python generator.py $1 $2
}


for i in {1..20}
do
	make_wargame 2 $i
done

for i in {1..20}
do
	make_wargame 3 $i
done

for i in {1..20}
do
	make_wargame 4 $i
done

for i in {1..20}
do
	make_wargame 5 $i
done

for i in {5..20}
do
	make_wargame $i 1
done
