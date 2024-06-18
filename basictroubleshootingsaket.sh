#!/bin/bash

# Get the PID of the process with the highest CPU usage
high_cpu_pid=$(ps H -eo pid,pcpu --sort=-pcpu | head -n 2 | tail -n 1 | awk '{print $1}')

# Check if we got a PID
if [ -z "$high_cpu_pid" ]; then
  echo "No process found."
  exit 1
fi

#Display system inforamtion
echo "System Information:"
hostnamectl
echo ""

# Display the IP address
echo "IP Address:"
hostname -I
echo ""

# Display the last logged-in user details
echo "Last Logged-in User:"
last -1
echo ""


# Get the full details of the process with the highest CPU usage
echo "Process with Highest CPU Usage"
ps aux | grep -w "$high_cpu_pid" | grep -v grep
echo ""

# Display system disk usage
echo ""
echo "Disk Usage:"
df -h
echo ""
# Display total system memory usage
echo ""
