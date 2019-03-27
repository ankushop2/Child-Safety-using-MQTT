import sys
import Adafruit_DHT
import ds18b20 as probetemp
from mq import *
from pulsesensor import Pulsesensor
from gps import GPSget
import random

def sensors():
    final_ret = dict()
    ###########DHT-11#############################DATA-PIN = 20
    humidity, temperature = Adafruit_DHT.read_retry(11,20)
    print("DHT done")
    #print("H = "+str(humidity)+" T = "+str(temperature))
    ##############################################
    ##############DS18b20##########################DATA-PIN = 04
    body_temperature = probetemp.read_temp()
    print("DS18B20 done")
    ##########################################
    #############MQ-135##########################DATA-PIN = 1(analog)
    mq = MQ()
    perc = mq.MQPercentage()
    print("MQ135 done")
    '''sys.stdout.write("\r")
    sys.stdout.write("\033[K")
    sys.stdout.write("LPG: %g ppm, CO: %g ppm, Smoke: %g ppm" % (perc["GAS_LPG"], perc["CO"], perc["SMOKE"]))
    sys.stdout.write("\n")
    sys.stdout.flush()'''
    ####################################################
    ##############Pulse Sensor#######################DATA-PIN = 0(analog)
    p = Pulsesensor()
    p.startAsyncBPM()
    while True:
        bpm = p.BPM
        #bpm = random.randint(50,70)
        if bpm > 0:
            #print("BPM: %d" % bpm)
            p.stopAsyncBPM()
            break
        else:
            #print("No Heartbeat found")
            time.sleep(1)
    print("Pulse done")    
    ######################################
    ###################GPS####################
    gps = GPSget()
    #########################################
    final_ret["ambient_temp"] = temperature
    final_ret["humidity"] = humidity
    final_ret["body_temp"] = body_temperature
    final_ret["LPG"] = perc["GAS_LPG"]
    final_ret["CO"] = perc["CO"]
    final_ret["Smoke"] = perc["SMOKE"]
    final_ret["Pulse"] = int(bpm)
    final_ret["loc_lat"] = gps[0]
    final_ret["loc_lng"] = gps[1]

    return final_ret
