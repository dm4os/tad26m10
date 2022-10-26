from operator import truediv
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

speed_ranges =  [30, 50, 60, 80, 100, 120] 

#returns a random value from the speed_ranges list
def get_speed_limit(limit):
    return random.choice(limit)

#returns the random value selected by the get_speed_limit function
def return_limit():
    return get_speed_limit(speed_ranges)

def car():

    oldSpeed = return_limit()
    newSpeed = return_limit()

    carIsMoving = False

    if oldSpeed >= 0 and newSpeed >= 0:
        carIsMoving = True
    else:
        carIsMoving = False

    print("Old speed limit is :", oldSpeed)
    print("New speed limit is :", newSpeed)

    if oldSpeed < newSpeed:
        print("New limit is:", newSpeed, "speed up")
        oldSpeed = newSpeed
    elif newSpeed < oldSpeed:
        print("New limit is :", newSpeed, "slow down")
        oldSpeed = newSpeed
    else:
        print("Maintain current speed")
        oldSpeed = newSpeed

    return oldSpeed, newSpeed

print("Randomly picked speed limit:", return_limit())


ctr = 0
while True:
    
    car()

    ctr += 1  # I increment the counter by 1
    
    # if condition. Breaks <<while loop>> if ctr == 100
    if ctr == 10:
        break
# print(car())

# #while loop that verifies that the functions work by printing six random speed limits
# i = 1
# while i <= 6:
#     print("Randomly picked speed limit:", return_limit())
#     i += 1