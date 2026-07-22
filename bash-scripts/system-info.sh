#!/bin/bash

echo "======================================="
echo "        SERVER HEALTH CHECK"
echo "======================================="

echo
echo "1. CPU Usage"
top -bn1 | grep "Cpu(s)"

echo
echo "2. Memory Usage"
free -h

echo
echo "3. Disk Usage"
df -h

echo
echo "4. Logged-in Users"
who

echo
echo "5. Running Processes"
ps -e

echo
echo "6. Server Uptime"
uptime

echo
echo "======================================="
echo "Health check completed."
echo "======================================="
