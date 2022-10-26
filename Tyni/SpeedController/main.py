from asyncio.windows_events import NULL
import random
import time
from re import I
from time import sleep

'''
System description
* streets have signs to make drivers aware about the speed limit.
    If i have a LIST of speed ranges, then I would use a python list.

    Speed ranges are: 
    * 0 [0..30]km/h
    * 1 [30..50]km/h
    * 2 [50..60]km/h
    * 3 [60..80]km/h
    * 4 [80..100]km/h
    * 5 [100..120]km/h

'''

speed_ranges = [0, 1, 2, 3, 4, 5] #List contains 6 values which are from 0-5.
speed_limits = [30, 50, 60, 80, 100, 120] #List contains 6 speed limits

#print(speed_ranges)

#Create a function which simulates the speed limits.

def set_speed_limits (somerange):
    match somerange:
        case 0:
            return random.randint(0, 30)
        case 1:
            return random.randint(30, 50)
        case 2:
            return random.randint(50, 60)
        case 3:
            return random.randint(60, 80)
        case 4:
            return random.randint(80, 100)
        case 5:
            return random.randint(100, 120)


def get_speed_limits (speed_limit_list):
    #Gets the speed limits list and returns one of them randomly
    return speed_limit_list[random.randint(0, 5)]

def return_speed_limit():
    #Returns the speed limit
    return get_speed_limits(speed_limits)

def car(new_limit):

    #Prints the new and the old speed limits.
    print("The new speed limit is ", new_limit, " and last speed limit was ", last_limit)

    #Compares the two speed limits to slow down/speed up if necessary
    if last_limit > new_limit:
        print("Slowing down")

    elif last_limit < new_limit:
        print("Speeding up")

    else:
        print("Driving at same speed")

last_limit = 0
ctr = 0

while ctr != 10:
    random_speed_rng_gen = random.randint(0, 5) #Just a random int between 0 and 5
    new_limit = return_speed_limit() #Gets a new random speed limit

    car(new_limit)

    last_limit = new_limit

    ctr += 1


