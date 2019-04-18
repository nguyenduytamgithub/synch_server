import os
import sys
import paho.mqtt.client as mqtt
import json
import base64
import ssl
THINGSBOARD_HOST = '209.97.173.222'
#THINGSBOARD_HOST = '192.168.1.19'
client = mqtt.Client()
# Connect to ThingsBoard using default MQTT port and 60 seconds keepalive interval
client.tls_set('C:/Users/nguye/Desktop/TRANS_FILE/ca.crt')
client.tls_insecure_set(False)
client.connect(THINGSBOARD_HOST, 8883, 60)
client.loop_start()

try:
   
    #client.publish('synch', json.dumps('ok'), 1)
	#f1=open("../image/image.jpg", "rb") #3.7kiB in same folder
	#fileContent = f1.read()
	#imageArray = bytearray(fileContent)
	#imageArray = base64.b64encode(fileContent).replace('\n','')
	#client.publish('synch', imageArray, 1)
	#f2=open("../image/image_name.txt", "rb") #3.7kiB in same folder
	#imageName = f2.read().replace('\n','')
	send_msg = {
		'image_name': "duy tam",
		'image_array': "dep trai"
	}
	client.publish('abc',json.dumps(send_msg), 0)	
except KeyboardInterrupt:
    pass

client.loop_stop()
client.disconnect()

