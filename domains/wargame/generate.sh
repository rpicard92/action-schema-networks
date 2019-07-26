#! /bin/bash

function make-wargame {
   python generator.py "$1" "$2"
}

for i in {1..5}
do
	make-wargame 2 0
	make-wargame 2 1
	make-wargame 2 2
	make-wargame 2 3
	make-wargame 2 4
	make-wargame 2 5
done

for i in {1..5}
do
	make-wargame 3 0
	make-wargame 3 1
	make-wargame 3 2
	make-wargame 3 3
	make-wargame 3 4
	make-wargame 3 5
done

for i in {1..5}
do
	make-wargame 4 0
	make-wargame 4 1
	make-wargame 4 2
	make-wargame 4 3
	make-wargame 4 4
	make-wargame 4 5
done

for i in {1..5}
do
	make-wargame 5 0
	make-wargame 5 1
	make-wargame 5 2
	make-wargame 5 3
	make-wargame 5 4
	make-wargame 5 5
done
