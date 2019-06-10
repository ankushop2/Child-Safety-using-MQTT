#!/usr/bin/env python
import json
import asyncio
import hbmqtt
from hbmqtt import client as hbmqttclient
from threading import Thread
import queue
from time import sleep
from random import random
import mysql.connector
import sys
import time

ttimetoinsert = time.strftime('%Y-%m-%d %H:%M:%S')
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="",
  database="studentdb"
)
mycursor = mydb.cursor()
#sql = "INSERT INTO main (response) VALUES (%s)"
sql = "INSERT INTO `devicelog` (`deviceser`, `timestamp`, `bodytemp`, `pulse`, `ambienttemp`, `ambienthumidity`, `COconc`, `Smokeconc`, `LPGconc`, `lat`, `lng`) VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
CLIENT_ID_LENGTH = 10#############TO BE COMPUTED########################
CLIENT_ID = "ClientBoi1" #############TO BE TAKEN FROM DB########################
MQTT_BROKER_URI = "mqtt://192.168.43.6:1883"
#MQTT_BROKER_URI = "mqtt://test.mosquitto.org:1883"
CHANNEL_ID = str(sys.argv[1])+"/response"#############TO BE TAKEN FROM DB########################
#MQTT_BROKER_URI = "mqtt://broker.hivemq.com:1883"
#CHANNEL_ID = "unofouramigos/chat1"

inputQueue = queue.Queue()


def getNextInputLine():

    global inputQueue
    #while True:
    inputLine = "GET_DATA"
    inputQueue.put(inputLine)

inputThread = Thread(target=getNextInputLine)
inputThread.start()

#print("Hello! You are client " + CLIENT_ID)
#print()

@asyncio.coroutine
def beginMQTTClient():
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

        # Handle local user trying to send a message
        try:
            inputLine = inputQueue.get_nowait()
            # print("Oh hey! A message from the user:")
            # print(inputLine)
            response = CLIENT_ID + " " + inputLine
            yield from client.publish(CHANNEL_ID, bytearray(response, "utf-8"))

        except queue.Empty:
            pass # No new user input

        if weGotMail:
            # Help from internal python docs on bytearray
            rawStrMsg = msg.data.decode("utf-8")
            clientId = rawStrMsg[0:CLIENT_ID_LENGTH]
            textMessage = rawStrMsg[CLIENT_ID_LENGTH+1:]

            # Ignore messages sent by us
            if clientId == CLIENT_ID:
                continue

            x= "Client " + clientId + ": " + textMessage
            textMessage = textMessage.replace("\'", "\"")
            print(textMessage[6:])
            x1 = json.loads(textMessage[6:])
            #print("2")
            #return x1
            #print(type(x1))
            #print(x1["CO"])
            #val = str(textMessage)
            mycursor.execute(sql, (sys.argv[1],ttimetoinsert,x1["body_temp"],x1["Pulse"],x1["ambient_temp"],x1["humidity"],x1["CO"],x1["Smoke"],x1["LPG"],x1["loc_lat"],x1["loc_lng"]))
            mydb.commit()
            #print(mycursor.rowcount, "record inserted.")
            break
            # response = CLIENT_ID + "Thanks!"
            # yield from client.publish("blue", bytearray(response, "utf-8"))
            # "blue", "Why thank you", client " + clientId + " for sending us " + textMessage"

asyncio.get_event_loop().run_until_complete(beginMQTTClient())


#{'body_temp': 32.5, 'ambient_temp': 16.0, 'Smoke': 0.020510476230736176, 'humidity': 160.0, 'Pulse': 65, 'CO': 0.004987133147384872, 'loc_lat': '12.8792', 'loc_lng': '77.5878', 'LPG': 0.007685629067439097}
#(`deviceser`, `timestamp`, `bodytemp`, `pulse`, `ambienttemp`, `ambienthumidity`, `COconc`, `Smokeconc`, `LPGconc`, `lat`, `lng`)