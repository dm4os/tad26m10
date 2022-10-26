import random

'''
System description:
* streets have signs to make drivers aware about the speed limit.
    if I have a LIST of speed ranges then I would use a python list.

    Speed ranges are:
    * 0 [0...30]km/h
    * 1 [30...50]km/h
    * 2 [50...60]km/h
    * 3 [60...80]km/h
    * 4 [80...100]km/h
    * 5 [100...120]km/h

'''

def set_speed(somerange):
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


def set_speed_limit():
    limits = [30,50,60,80,100,120]
    return random.choice(limits)

def return_speed_limit():
    return set_speed_limit()

def set_speed_based_on_limit(limit):
    match limit:
        case 30:
            return set_speed(0)
        case 50:
            return set_speed(1)
        case 60:
            return set_speed(2)
        case 80:
            return set_speed(3)
        case 100:
            return set_speed(4)
        case 120:
            return set_speed(5)


class Car:
    def __init__(self, old_speed, current_speed):
        self.old_speed = old_speed
        self.current_speed = current_speed
    
    def adjust_speed(self, limit):
        self.old_speed = self.current_speed
        self.current_speed = set_speed_based_on_limit(limit)
        print("Current limit is: ", limit, "km/h")
        print("Old speed: ",self.old_speed)
        print("Current speed: ",self.current_speed)


new_car = Car(0,0)


new_car.adjust_speed(set_speed_limit())
new_car.adjust_speed(set_speed_limit())