#!/bin/sh

echo "Killall mjpg_streamer"
killall mjpg_streamer

echo "Start mjpg_streamer"
/usr/local/bin/mjpg_streamer -i "input_uvc.so -r 1280x720 -d /dev/video0 -f 30 -q 100" -o "output_http.so -p 8080 -w /usr/local/share/mjpg-streamer/www" > /dev/null 2>&1 &

echo "Start setup camera"

echo "Init..."
sleep 10
echo "Init...OK"
#while true; do
	link="/root/synch_server/device"
	datetime="$(date +%Y-%m-%d-%H_%M_%S)"
	filename="${link}/img_storage/${datetime}.jpg"
	echo "We will export to ${filename}"
	echo -e "${datetime}" >> ${link}/excel/dataset.csv  > ${link}/image/image_name.txt
	wget http://127.0.0.1:8080/?action=snapshot -O ${filename}
	cp ${filename} ${link}/image/image.jpg
	#sleep 1
	#echo "Start synch image"
	#python /home/pi/NDT/synch/code/publish2.py
	#echo "Finish synch image - go to sleep"
	#sleep 10
#done

exit 0

