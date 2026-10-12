#!/bin/bash

# System Information Report
echo "========================================"
echo "      SYSTEM INFORMATION REPORT"
echo "========================================"
echo "Hostname:    $(hostname)"
echo "OS:          $(lsb_release -d | cut -f2)"
echo "Kernel:      $(uname -r)"
echo "Uptime:      $(uptime -p)"
echo "----------------------------------------"
echo "Memory Usage:"
free -h | awk '/Mem:/ {print "  Used: " $3 " / " $2}'
echo "----------------------------------------"
echo "Disk Usage (root filesystem):"
df -h / | awk '/\// {print "  Used: " $3 " / " $2 " (" $5 ")"}'
echo "========================================"

