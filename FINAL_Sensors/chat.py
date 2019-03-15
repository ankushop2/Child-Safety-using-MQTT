import asyncio
import hbmqtt
from hbmqtt import client as hbmqttclient
from threading import Thread
import queue
from time import sleep
from random import random
from sensors import sensors
import json

CLIENT_ID_LENGTH = 10 #############TO BE COMPUTED###############
CLIENT_ID = "SensorBoi1" #####################TO BE TAKEN FROM DB##################
MQTT_BROKER_URI = "mqtt://192.168.1.100:1883"
#MQTT_BROKER_URI = "mqtt://test.mosquitto.org:1883" ##if test online
CHANNEL_ID = "testing/response" #####################TO BE TAKEN FROM DB##################

inputQueue = queue.Queue() ####### GLOBAL QUEUE FOR STORING MESSAGES IN THE CURRENT SESSION################
def getNextInputLine():
    global inputQueue
    while True:
        inputLine = input()
        inputQueue.put(inputLine)

inputThread = Thread(target=getNextInputLine)
inputThread.start()

print("Hello! You are client " + CLIENT_ID)
print()

@asyncio.coroutine
def beginMQTTClient():############################ DEFINING COROUTINE###################
    client = hbmqttclient.MQTTClient()
    yield from client.connect(MQTT_BROKER_URI)
    yield from client.subscribe([(CHANNEL_ID, hbmqtt.mqtt.constants.QOS_0)])
    while True:
        weGotMail = False
        try:
            msg = yield from client.deliver_message(timeout=.1)
            weGotMail = True
        except asyncio.TimeoutError:
            pass
        except asyncio.IncompleteReadError:
            print("GGWP")
        # Handle local user trying to send a message
        try:
            inputLine = inputQueue.get_nowait()
            response = CLIENT_ID + " " + inputLine
            yield from client.publish(CHANNEL_ID, bytearray(response, "utf-8"))

        except queue.Empty:
            pass # No new user input

        if weGotMail:
            # DECODING BYTEARRAY INTO utf-8
            rawStrMsg = msg.data.decode("utf-8")
            clientId = rawStrMsg[0:CLIENT_ID_LENGTH]
            textMessage = rawStrMsg[CLIENT_ID_LENGTH+1:]
            #textMessage = str(sensors())
            #continue    

            # IGNORE OWN MESSAGES
            if clientId == CLIENT_ID:
                continue

            print("Client " + clientId + ": " + textMessage)
            if(textMessage == "GET_DATA"):
                try:
                    pre_response = str(sensors())
                    response =  "Client" + clientId + ":" + pre_response
                    #print(response)
                    yield from client.publish(CHANNEL_ID, bytearray(response, "utf-8")) #######################REPLY TO SENDER WITH INFO(SENSOR STUFF)#############
                except asyncio.IncompleteReadError:
                    print("Try again")
            #weGotMail = False
try:
    asyncio.get_event_loop().run_until_complete(beginMQTTClient())
except asyncio.IncompleteReadError:
    print("GG")
