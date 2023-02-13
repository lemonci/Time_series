import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import math
import random


# Plot P(X=i) for a reasonable interval of X and alpha in {0.01, 0.1, 0.5, 1}
def prob_Poisson(i: int, alpha):
    
    return math.exp(-alpha)*(alpha**i)/(math.factorial(i))

Poisson_list_0 = [None] * 10
Poisson_list_1 = [None] * 10
Poisson_list_2 = [None] * 10
Poisson_list_3 = [None] * 10

def gen_Poisson(Poisson_list: list, alpha):
    for i in range(len(Poisson_list)):
        Poisson_list[i] = prob_Poisson(i+1, alpha)
    return Poisson_list

gen_Poisson(Poisson_list_0, 0.01)
gen_Poisson(Poisson_list_1, 0.1)
gen_Poisson(Poisson_list_2, 0.5)
gen_Poisson(Poisson_list_3, 1)


'''plt.plot(Poisson_list_0)
plt.plot(Poisson_list_1)
plt.plot(Poisson_list_2)
plt.plot(Poisson_list_3)
'''

# Implement a model that iterates over these two phases: calculate and administrate
# new incoming jobs, then operate on the current job (one at a time). 
# Generate a sample of 2000 time steps for alpha = 0.1 and a processing duration of 4 steps per
# job. What is the average length of the waiting list?

wl_avg = [None] * 200

for j in range(200):
    waiting_list = [0] * 2000
    for i in range(2000): # time step
        sample = np.random.poisson(lam=0.5)
        if i == 0:
            waiting_list[i] += sample
        else:
            if sample > 0:
                waiting_list[i] += waiting_list[i-1] + sample
        if waiting_list[i] > 0:
            waiting_list[i] -= 0.25
    wl_avg[j] = np.average(waiting_list)
            
print(np.average(wl_avg))