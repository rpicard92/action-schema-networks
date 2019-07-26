#!/usr/bin/python

import sys
import random



def main():
	#args
	size = int(sys.argv[1])
	print('nbr_aircraft_per_team: ' + str(size))
	if(len(sys.argv) == 3):	
		seed = int(sys.argv[2])
		random.seed(seed)
		print('rand_seed: ' + str(seed))

	# make file
	name = "problem_" + str(size) + "_aircraft_rand_" + str(seed)
	filename = name + ".pddl"
	f = open(filename,"w+")
	f.write("(define (problem " + name + ")\n")
	f.write("  (:domain wargame)\n")	
	f.write("  (:objects")	
	for i in range(size):
		f.write(" b" + str(i+1))	
	for i in range(size):
		f.write(" r" + str(i+1))
	f.write(" - fighter)\n")
	f.write("  (:init\n")	
	
	# blue team
	f.write("\n	; blue team\n")	
	for i in range(size):
		f.write("	(blue b" + str(i+1) + ")\n")
	f.write("\n	; generation\n")	
	for i in range(size):
		rand = random.randint(1,10)
		if(rand > 5):
			f.write("	(fourth-gen b" + str(i+1) + ")\n")
		else:
			f.write("	(fifth-gen b" + str(i+1) + ")\n")
	f.write("\n	; order\n")
	f.write("	(front b1)\n")	
	for i in range(size-1):
		f.write("	(behind b" + str(i+1+1) + " b" + str(i+1) + ")\n")
	f.write("	(last b" + str(size) + ")\n")


	# red team
	f.write("\n	; red team\n")	
	for i in range(size):
		f.write("	(red r" + str(i+1) + ")\n")
	f.write("\n	; generation\n")	
	for i in range(size):
		rand = random.randint(1,10)
		if(rand > 5):
			f.write("	(fourth-gen r" + str(i+1) + ")\n")
		else:
			f.write("	(fifth-gen r" + str(i+1) + ")\n")
	f.write("\n	; order\n")
	f.write("	(front r1)\n")	
	for i in range(size-1):
		f.write("	(behind r" + str(i+1+1) + " r" + str(i+1) + ")\n")
	f.write("	(last r" + str(size) + ")\n")
	f.write("  )\n\n")

	# goal
	f.write("  (:goal (and ")
	for i in range(size):
		f.write("(destroyed r" + str(i+1) + ") ")
	f.write("(or ")
	for i in range(size):
		f.write(" (not (destroyed b" + str(i+1) + "))")
	f.write(")))\n")
	f.write("  (:goal-reward 1)\n")
	f.write("  (:metric maximize (reward))\n")
	f.write(")")

	f.close() 


main()

