#! /bin/bash

function ssipp_lm_cut1 {
	'/home/ron/Desktop/git/asnets/deepfpg/ssipp/solver_ssp' -h lm-cut -R 30 domain.pddl problem_$1_aircraft_rand_$i.pddl > /home/ron/Desktop/git/asnets/deepfpg/experiment-results/Results/SSIPP_LM_Cut_Results/problem_$1_aircraft_rand_$i.txt
}

function ssipp_lm_cut2 {
	'/home/ron/Desktop/git/asnets/deepfpg/ssipp/solver_ssp' -h lm-cut -R 30 domain.pddl problem_$1_aircraft_rand_$2.pddl > /home/ron/Desktop/git/asnets/deepfpg/experiment-results/Results/SSIPP_LM_Cut_Results/problem_$1_aircraft_rand_$2.txt
}

for i in {1..20}
do
	ssipp_lm_cut1 3 $i
done

for i in {1..20}
do
	ssipp_lm_cut1 4 $i
done

for i in {1..20}
do
	ssipp_lm_cut1 5 $i
done


for i in {5..13}
do
	ssipp_lm_cut2 $i 1
done
