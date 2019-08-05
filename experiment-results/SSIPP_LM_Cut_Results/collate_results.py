# !/usr/bin/python

import os

import json
from glob import glob
import re
import numpy as np
def Average(lst): 
	lst = [float(i) for i in lst]
	s = sum(lst)/len(lst)
	return s

f = open("collated_results.txt","w+")


train_trial1_costs = []
train_trial1_times = []
train_trial1_wins = []

train_trial2_costs = []
train_trial2_times = []
train_trial2_wins = []

train_trial3_costs = []
train_trial3_times = []
train_trial3_wins = []

train_trial4_costs = []
train_trial4_times = []
train_trial4_wins = []

train_trial5_costs = []
train_trial5_times = []
train_trial5_wins = []

test_trial1_costs = []
test_trial1_times = []
test_trial1_wins = []

test_trial2_costs = []
test_trial2_times = []
test_trial2_wins = []

test_trial3_costs = []
test_trial3_times = []
test_trial3_wins = []

test_trial4_costs = []
test_trial4_times = []
test_trial4_wins = []

test_trial5_costs = []
test_trial5_times = []
test_trial5_wins = []


total = 0
for root, dirs, files in os.walk("."):
	print(sorted(np.asarray(files)))
	fls = sorted(np.asarray(files))
	print(len(fls))
	for i in range(0,len(fls)):
		name = fls[i]
		print(name)
		#print(os.path.join(root, name))
		s = name.split('.')
		if(len(s) == 2):
			if(s[1] == 'txt' and s[0] != 'collated_results'):
				count = 0
				ave_times = []
				fi = str(os.path.join(root, name))
				with open(fi) as search:
					for line in search:
						if(str(line).find('Observed Avg cost') != -1):
							print(str(line))
							ave_cost = float(re.findall(r"[-+]?\d*\.\d+|\d+", line)[0])
							print(str(ave_cost))
						elif(str(line).find('[Round Summary]: CPU+System time') != -1):
							ave_time_temp = float(re.findall(r"[-+]?\d*\.\d+|\d+", line)[0])
							ave_times.append(ave_time_temp)
							print(str(ave_time_temp))
						elif(str(line).find('[Round Summary]: status =') != -1):
							if(str(line).find('goal-reached') != -1):
								count = count + 1

				print(count)
				if(ave_times != []):
					ave_time = Average(ave_times)
					f.write(str(name) + '\n ' + str(ave_time) + '\n')
				if(str(fi).find("rand_5") != -1 or str(fi).find("rand_4") != -1 or str(fi).find("rand_3") != -1 or str(fi).find("rand_2") != -1 or str(fi).find("rand_1") != -1):
					train_trial1_costs.append(ave_cost)
					train_trial1_times.append(ave_time)
					train_trial1_wins.append(count)
				else:
					test_trial1_costs.append(ave_cost)
					test_trial1_times.append(ave_time)
					test_trial1_wins.append(count)

				if(str(fi).find("rand_5") != -1 or str(fi).find("rand_4") != -1 or str(fi).find("rand_3") != -1 or str(fi).find("rand_2") != -1 or str(fi).find("rand_1") != -1):
					train_trial2_costs.append(ave_cost)
					train_trial2_times.append(ave_time)
					train_trial2_wins.append(count)
				else:
					test_trial2_costs.append(ave_cost)
					test_trial2_times.append(ave_time)
					test_trial2_wins.append(count)

				if(str(fi).find("rand_3") != -1 or str(fi).find("rand_2") != -1 or str(fi).find("rand_1") != -1):
					train_trial3_costs.append(ave_cost)
					train_trial3_times.append(ave_time)
					train_trial3_wins.append(count)
				else:
					test_trial3_costs.append(ave_cost)
					test_trial3_times.append(ave_time)
					test_trial3_wins.append(count)

				if(str(fi).find("rand_5") != -1 or str(fi).find("rand_4") != -1 or str(fi).find("rand_3") != -1 or str(fi).find("rand_2") != -1 or str(fi).find("rand_1") != -1):
					train_trial4_costs.append(ave_cost)
					train_trial4_times.append(ave_time)
					train_trial4_wins.append(count)
				else:
					test_trial4_costs.append(ave_cost)
					test_trial4_times.append(ave_time)
					test_trial4_wins.append(count)

				if(str(fi).find("rand_1") != -1):
					test_trial5_costs.append(ave_cost)
					test_trial5_times.append(ave_time)
					test_trial5_wins.append(count)
				total = total + 1

f.write('\n\n\n\n\n\n')

f.write('Total Runs: ' + str(total) + '\n')

f.write('\n\n\n\n\n\n')

f.write('train trial 1: \n')
f.write('ave_cost:' + str(Average(train_trial1_costs)) + '\n')
f.write('ave_time:' + str(Average(train_trial1_times)) + '\n')
f.write('ave_wins:' + str(Average(train_trial1_wins)) + '\n')
f.write('\n')
f.write('train trial 2: \n')
f.write('ave_cost:' + str(Average(train_trial2_costs)) + '\n')
f.write('ave_time:' + str(Average(train_trial2_times)) + '\n')
f.write('ave_wins:' + str(Average(train_trial2_wins)) + '\n')
f.write('\n')
f.write('train trial 3: \n')
f.write('ave_cost:' + str(Average(train_trial3_costs)) + '\n')
f.write('ave_time:' + str(Average(train_trial3_times)) + '\n')
f.write('ave_wins:' + str(Average(train_trial3_wins)) + '\n')
f.write('\n')
f.write('train trial 4: \n')
f.write('ave_cost:' + str(Average(train_trial4_costs)) + '\n')
f.write('ave_time:' + str(Average(train_trial4_times)) + '\n')
f.write('ave_wins:' + str(Average(train_trial4_wins)) + '\n')
f.write('\n')
f.write('train trial 5: \n')
f.write('ave_cost:' + str(Average(train_trial3_costs)) + '\n')
f.write('ave_time:' + str(Average(train_trial3_times)) + '\n')
f.write('ave_wins:' + str(Average(train_trial3_wins)) + '\n')
f.write('\n')

f.write('\n\n\n\n')

f.write('test trial 1: \n')
f.write('ave_cost:' + str(Average(test_trial1_costs)) + '\n')
f.write('ave_time:' + str(Average(test_trial1_times)) + '\n')
f.write('ave_wins:' + str(Average(test_trial1_wins)) + '\n')
f.write('\n')
f.write('test trial 2: \n')
f.write('ave_cost:' + str(Average(test_trial2_costs)) + '\n')
f.write('ave_time:' + str(Average(test_trial2_times)) + '\n')
f.write('ave_wins:' + str(Average(test_trial2_wins)) + '\n')
f.write('\n')
f.write('test trial 3: \n')
f.write('ave_cost:' + str(Average(test_trial3_costs)) + '\n')
f.write('ave_time:' + str(Average(test_trial3_times)) + '\n')
f.write('ave_wins:' + str(Average(test_trial3_wins)) + '\n')
f.write('\n')
f.write('test trial 4: \n')
f.write('ave_cost:' + str(Average(test_trial4_costs)) + '\n')
f.write('ave_time:' + str(Average(test_trial4_times)) + '\n')
f.write('ave_wins:' + str(Average(test_trial4_wins)) + '\n')
f.write('\n')
f.write('test trial 5: \n')
f.write('ave_cost:' + str(Average(test_trial5_costs)) + '\n')
f.write('ave_time:' + str(Average(test_trial5_times)) + '\n')
f.write('ave_wins:' + str(Average(test_trial5_wins)) + '\n')
f.write('\n')

f.close

print('Total:' + str(total))
					


