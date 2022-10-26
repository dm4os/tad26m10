import random

'''
System description:
* streets have signs to make drivers aware about the speed limit. 
    If I have a LIST of speed ranges then I would use a python list.

    Speed range are: []
    * 0 [0..30]km/h
    * 1 [30..50]km/h
    * 2 [50..60]km/h
    * 3 [60..80]km/h
    * 4 [80..100]km/h
    * 5 [100..120]km/h

'''

speed_limits =  [30, 50, 60, 80, 100, 120]

speed_limit = int

# Randomize the speed limit from a given list
def randomize_speed_limit():
    global speed_limit
    speed_limit = random.choice(speed_limits)
    
#  Randomize driving speed from that speed-10
def find_speed_within_current_limit():
    return random.randint(speed_limit-10, speed_limit)

ctr = 0

while  True: 
    randomize_speed_limit()
    print("Current speed limit -> ", speed_limit)

    new_speed = find_speed_within_current_limit()
    print("Driving speed -> ", new_speed)

    acceleration = 0

    # At the beginning, there is no acceleration, so we skip the first loop.
    # Unless you count from 0 to the current speed,
    # but we're not simulating drive startup in this script quite yet
    if ctr != 0:
        acceleration = previous_speed - new_speed

    previous_speed = new_speed
    
    # We announce how much acceleration/deceleration is necessary and print it
    if acceleration>0:
        print("Deceleration necessary ", acceleration)
    if acceleration<0:
        acceleration = acceleration * -1
        print("Acceleration necessary ", acceleration)
    if acceleration == 0:
        print("No acceleration necessary")

    # To simulate changes in speed limits during normal drive, we run the script X times, 3 in this case
    ctr += 1

    if ctr == 3:
        break