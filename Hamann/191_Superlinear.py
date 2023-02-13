# 1.9.2 Superlinear Speedup
import math
import random
import matplotlib.pyplot as plt

problem_size = 100

def prob_cache(p):
    return 1/(1+math.exp(-0.1*(p-20)))

def prob_task(s):
    return 0.5*(1-1/(1+math.exp(-0.05*(s-15))))+0.25

#def prob_memory(s):
#    return 1-prob_task(s)


def execute(problem_size, p):
    counter = 0
    performance = 0
    s = problem_size / p
    s_list = [s] * p
    while all(s>0 for s in s_list):
        counter += 1
        for i in range(p):
            if random.random() < prob_cache(p):
                # execute cache
                pass
            elif random.random() < prob_task(s):
                #execute task
                s_list[i] -= 1
                performance += 1
            else:
                # execute memory
                pass
    return performance/(counter)

p_list = list(range(81))[1:]
performance_list = [None]*80

for p in p_list:
    performance_list[p-1] = execute(100, p)
    
unit_time = performance_list[0]
normalized_performance_list = [x/unit_time for x in performance_list]
plt.plot(normalized_performance_list)