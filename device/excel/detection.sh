#!/bin/bash
input="../image/image_name.txt"
while IFS= read -r var; do
	datetime="$(date +%Y-%m-%d-%H%M%S)"
	echo -n "${datetime}," >> ../excel/count.csv
	object=$(./darknet detect cfg/yolov3-tiny.cfg yolov3-tiny.weights ${var} | grep '%') # grep -Pzo 'Predicted(.*)*')
	echo "${object}"
	echo "${object}" >> ../excel/count.csv # > result.txt  #| wc -l >> ../excel/count.csv
done < "$input"
