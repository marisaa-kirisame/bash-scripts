#!/bin/bash

# Threshold for RAM usage (in percentage)
THRESHOLD=90

# Function to calculate current RAM usage
calculate_ram_usage() {
    # Get the total and used memory from the 'free' command
    total=$(free -m | awk '/^Mem:/{print $2}')
    used=$(free -m | awk '/^Mem:/{print $3}')
    
    # Calculate RAM usage percentage
    ram_usage=$((used * 100 / total))
    echo $ram_usage
}

# Function to kill Firefox
kill_process() {
    # Find and kill all Firefox processes
    echo "RAM usage is above $THRESHOLD%. Killing firefox..."
    pkill -f firefox
    echo "Firefox has been killed."
	notify-send -u critical "Process Killed" "Firefox has been killed because RAM usage exceeded ${THRESHOLD}%."
	exit
}

# Main loop to monitor RAM usage
while true; do
    # Calculate current RAM usage
    ram_usage=$(calculate_ram_usage)
    
    # echo "Current RAM usage: $ram_usage%"

    # Check if RAM usage exceeds the threshold
    if [ "$ram_usage" -ge "$THRESHOLD" ]; then
        kill_process
    fi

    # Wait for a specified interval before checking again
    sleep 1  # Adjust the sleep interval as needed
done

