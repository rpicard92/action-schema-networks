# !/usr/bin/python

import os

import json
from glob import glob

def Average(lst): 
    return reduce(lambda a, b: a + b, lst) / len(lst) 

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
for root, dirs, files in os.walk(".", topdown=False):
	for name in files:
		#print(os.path.join(root, name))
		s = name.split('.')
		if(len(s) == 2):
			if(s[1] == 'json'):
				fi = str(os.path.join(root, name))
				with open(fi) as json_file:
				    	data = json.load(json_file)
					
					costs = []	
					count = 0	    
					for cost in data['all_costs']:
						costs.append(cost)
						count = count + 1
					ave_cost = Average(costs)
					f.write('file: \n')
					f.write(os.path.join(root, name) + '\n')
					f.write('cost: \n')
					f.write(str(ave_cost) + '\n')

					times = []
					count = 0	    
					for time in data['all_exec_times']:
						times.append(time)
						count = count + 1
					ave_time = Average(times)
					f.write('time: \n')
					f.write(str(ave_time) + '\n')

					count = 0	    
					for goal in data['all_goal_reached']:
						if(goal == True):
							count = count + 1
					f.write('win_count: \n')
					f.write(str(count) + '\n')



					if(str(fi).find("trial1") != -1):
						if(str(fi).find("rand_5") != -1 or str(fi).find("rand_4") != -1 or str(fi).find("rand_3") != -1 or str(fi).find("rand_2") != -1 or str(fi).find("rand_1") != -1):
							train_trial1_costs.append(ave_cost)
							train_trial1_times.append(ave_time)
							train_trial1_wins.append(count)
						else:
							test_trial1_costs.append(ave_cost)
							test_trial1_times.append(ave_time)
							test_trial1_wins.append(count)
					elif(str(fi).find("trial2") != -1):
						if(str(fi).find("rand_5") != -1 or str(fi).find("rand_4") != -1 or str(fi).find("rand_3") != -1 or str(fi).find("rand_2") != -1 or str(fi).find("rand_1") != -1):
							train_trial2_costs.append(ave_cost)
							train_trial2_times.append(ave_time)
							train_trial2_wins.append(count)
						else:
							test_trial2_costs.append(ave_cost)
							test_trial2_times.append(ave_time)
							test_trial2_wins.append(count)
					elif(str(fi).find("trial3") != -1):
						if(str(fi).find("rand_3") != -1 or str(fi).find("rand_2") != -1 or str(fi).find("rand_1") != -1):
							train_trial3_costs.append(ave_cost)
							train_trial3_times.append(ave_time)
							train_trial3_wins.append(count)
						else:
							test_trial3_costs.append(ave_cost)
							test_trial3_times.append(ave_time)
							test_trial3_wins.append(count)
					elif(str(fi).find("trial4") != -1):
						if(str(fi).find("rand_5") != -1 or str(fi).find("rand_4") != -1 or str(fi).find("rand_3") != -1 or str(fi).find("rand_2") != -1 or str(fi).find("rand_1") != -1):
							train_trial4_costs.append(ave_cost)
							train_trial4_times.append(ave_time)
							train_trial4_wins.append(count)
						else:
							test_trial4_costs.append(ave_cost)
							test_trial4_times.append(ave_time)
							test_trial4_wins.append(count)
					elif(str(fi).find("trial5") != -1):
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
					

   #for name in dirs:
      #print(os.path.join(root, name))
