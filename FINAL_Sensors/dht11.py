import sys
import Adafruit_DHT

while True:
    humidity, temperature = Adafruit_DHT.read_retry(11,20)
    print("H = "+str(humidity)+" T = "+str(temperature))