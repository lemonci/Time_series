import random
import pandas as pd
import matplotlib.pyplot as plt

def create_position():
    x = random.random()
    y = random.random()
    return (x, y)

def judge_neighbour(f1: tuple, f2: tuple, r):
    dist_sqr = (f1[0] - f2[0]) ** 2 + (f1[1] - f2[1]) ** 2
    if dist_sqr < (r ** 2):
        return True
    else:
        return False

num_flies = 150
r = 0.5

def create_adj_mx(num_flies, r):
    fly_list = [create_position() for i in range(num_flies)]
    adj_matrix = [[0 for i in range(num_flies)] for j in range(num_flies)]
    
    for i in range(num_flies):
        for j in range(i+1):
            if judge_neighbour(fly_list[i], fly_list[j], r):
                adj_matrix[i][j] = 1
                adj_matrix[j][i] = 1
            else:
                pass
                #adj_matrix[i][j] = 0
                #adj_matrix[j][i] = 0
                
    adj_matrix_df = pd.DataFrame(adj_matrix)
    return adj_matrix_df

# create the flash time series

neighbours = create_adj_mx(num_flies, r)
neighbours_num = neighbours.sum().tolist()
Ld2 = 25

def create_time_series(Ld2):
    flash_timeline = []
    for _ in range(Ld2):
        flash_timeline.append(1)
    for _ in range(Ld2):
        flash_timeline.append(0)
    return flash_timeline

flash_time = create_time_series(Ld2)
counters = [0]* num_flies

def check_neighbour_flash(f, neighbours = neighbours, neighbours_num = neighbours_num, counters = counters, flash_time = flash_time):
    counters_mod = [x % 50 for x in counters]
    flash_status = [x > 0 and x < 26 for x in counters_mod]
    flash_neighbour_num = 0
    for i in neighbours:
        if neighbours[f][i] * flash_status[i] > 0:
            flash_neighbour_num += 1
    if flash_neighbour_num > neighbours_num[f]:
        return 1
    else:
        return 0
    
time_steps = 5000
flash_record = [0] * time_steps
for t in range(time_steps):
    counters = [counter+1 for counter in counters]
    for f in range(num_flies):
        clock_adjust = check_neighbour_flash(f)
        counters[f] = counters[f] - clock_adjust
    counters_mod = [x % 50 for x in counters]
    flash_status = [x > 0 and x < 26 for x in counters_mod]
    flash_record[t] = sum(flash_status)

plt.xlabel("Steps")
plt.ylabel("Flash number")
plt.plot(flash_record)