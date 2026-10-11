
#!/bin/bash

# System Information Report

LOG_FILE="$HOME/ds1202-project/logs/sysinfo.log"

echo "===== System Information Report ====="
echo "Date and Time: $(date)"
echo "Hostname: $(hostname)"
echo "Operating System: $(grep PRETTY_NAME /etc/os-release | cut -d '"' -f 2)"
echo "Kernel: $(uname -r)"

echo ""
echo "===== MEMORY USAGE ====="
free -h

echo ""
echo "===== DISK USAGE ====="
df -h /

echo ""
echo "===== Logging ====="
echo "System report generated at $(date)" >> "$LOG_FILE"
echo "Report saved to: $LOG_FILE"
echo "====================================="

