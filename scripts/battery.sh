#!/bin/bash
bat_files="/sys/class/power_supply/BAT0"
LOW_WARNING=30
CRITICAL=15
MAX=98

dunstify "Battery Warning" "Running in background" -u low --timeout=10000

while [ true ]
do
  bat_status=$(cat "${bat_files}/status")
  # bat_status="Discharging"
  capacity=$(cat "${bat_files}/capacity")
  sleep_time=10
  if [[ "${bat_status}" == "Discharging" && ${capacity} -le $LOW_WARNING ]]; then
      # timeout after 10 seconds
      dunstify "Battery alert" "${capacity}%\nstatus: ${bat_status}" --urgency=critical --timeout=10000
      sleep_time=5
  
  elif [[ "${bat_status}" == "Discharging" && ${capacity} -le $CRITICAL ]]; then 
    # timeout after 10 seconds
    dunstify "WARNING: BATTERY AT ${capacity}%" "status: ${bat_status}" --urgency=critical --timeout=10000
    sleep_time=5
  else
    sleep_time=10
  fi

  if [[ "${bat_status}" == "Charging" && ${capacity} -ge MAX ]]; then
    dunstify "Battery Alert" "Battery at ${capacity}\nPlease Take off charger" --urgency=critical --timeout=10000
  fi

  sleep ${sleep_time}m
done
