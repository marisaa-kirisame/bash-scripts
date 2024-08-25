#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Please provide a file"
	exit
fi

input_file="$1"
output_file="${input_file%.*}.mp4"

ffmpeg -i "$input_file" -acodec mp3 -vcodec copy "$output_file"
