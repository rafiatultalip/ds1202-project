#!/bin/bash

# Output file path
LOG_FILE="$(dirname "$0")/../logs/sysinfo.log"
TIMESTAMP="Generated: $(date '+%Y-%m-%d %H:%M:%S')"

# Collect system info
HOSTNAME=$(hostname)
OS_NAME=$(lsb_release -d | cut -f2)
KERNEL_VER=$(uname -r)
UPTIME=$(uptime -p)
CPU_LOAD=$(uptime | sed 's/.*load average:/Load Average:/')
MEM_USAGE=$(free -h | awk '/^Mem:/ {print "Memory: " $3 " / " $2}')
DISK_USAGE=$(df -h / | awk '/\// {print "Disk (/): " $3 " / " $2 " (" $5 ")"}')

# Build report
REPORT_TEXT="
========================================
        SYSTEM INFORMATION REPORT
$TIMESTAMP
========================================
Hostname:    $HOSTNAME
OS:          $OS_NAME
Kernel:      $KERNEL_VER
Uptime:      $UPTIME
$CPU_LOAD
$MEM_USAGE
$DISK_USAGE
========================================
"

# Print to screen
echo "$REPORT_TEXT"

# Save to log file
echo "$REPORT_TEXT" >> "$LOG_FILE"
echo "✅ Report saved to: $LOG_FILE"
