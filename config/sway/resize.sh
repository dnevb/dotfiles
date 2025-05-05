#!/bin/bash

# Define the preset percentages
presets=("25" "50" "75")

# Get the ID of the currently focused window (using swaymsg)
focused=$(swaymsg -t get_tree | jq '.. | select(.type?) | select(.focused==true)')
focused_id=$(echo $focused | jq '.id')
focused_persent=$(echo $focused | jq '.percent')

if [ -z "$focused_id" ]; then
  exit 1
fi

# Store the current preset index in a temporary file
state_file="/tmp/sway_resize_state_${focused_id}"

# Read the current index, default to 0
current_index=$(cat "$state_file" 2>/dev/null || echo "0")

# Calculate the next index
next_index=$(( (current_index + 1) % ${#presets[@]} ))

# Get the next preset percentage
next_percentage="${presets[$next_index]}"

# Resize the window (using swaymsg) - adjust width/height as needed
swaymsg "resize set width $next_percentage ppt"

# Save the new index
echo "$next_index" > "$state_file"
