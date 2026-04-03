#!/bin/bash

# VM Health Check Script
# Usage: /health or /health explain

# Function to check VM health
check_vm_health() {
    # Get CPU usage (average over last 1 minute)
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    
    # Get Memory usage
    memory_info=$(free | grep Mem)
    memory_total=$(echo $memory_info | awk '{print $2}')
    memory_used=$(echo $memory_info | awk '{print $3}')
    memory_usage=$(echo "scale=2; ($memory_used / $memory_total) * 100" | bc)
    
    # Get Disk usage for root partition
    disk_usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
    
    # Store values
    declare -A health_status
    health_status[cpu]=$cpu_usage
    health_status[memory]=$memory_usage
    health_status[disk]=$disk_usage
    
    # Check if all metrics are healthy (< 60%)
    healthy=true
    
    if (( $(echo "$cpu_usage >= 60" | bc -l) )); then
        healthy=false
    fi
    
    if (( $(echo "$memory_usage >= 60" | bc -l) )); then
        healthy=false
    fi
    
    if (( $(echo "$disk_usage >= 60" | bc -l) )); then
        healthy=false
    fi
    
    # Output based on command
    if [[ "$1" == "explain" ]]; then
        echo "=========================================="
        echo "VM Health Check - Detailed Report"
        echo "=========================================="
        echo "CPU Usage:     $(printf '%.2f' $cpu_usage)%"
        echo "Memory Usage:  $(printf '%.2f' $memory_usage)%"
        echo "Disk Usage:    $disk_usage%"
        echo "=========================================="
        if [ "$healthy" = true ]; then
            echo "Status: VM is healthy ✓"
        else
            echo "Status: VM is not healthy ✗"
        fi
        echo "=========================================="
    else
        if [ "$healthy" = true ]; then
            echo "VM is healthy"
        else
            echo "VM is not healthy"
        fi
    fi
}

# Main execution
case "$1" in
    explain)
        check_vm_health "explain"
        ;;
    *)
        check_vm_health
        ;;
esac
