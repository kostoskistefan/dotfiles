#!/bin/sh

raw_sinks=$(pactl list sinks | grep -E "^Sink|^[[:space:]]Description" | sed -e "s/^Sink //g;s/^[[:space:]]Description: //g" | tr '\n' ' ')

# Remove first #
raw_sinks=${raw_sinks:1}

raw_sinks=$(echo $raw_sinks | sed -e 's/ #/,/g')

IFS=',' read -r -a raw_sinks <<< $raw_sinks

declare -A sinks
for raw_sink in "${raw_sinks[@]}"; do
    sink_id="${raw_sink%% *}"
    sink_name="${raw_sink#$sink_id }"
    sinks["${sink_id}"]=$sink_name
done

script_path=$(cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P)
rofi_options=$(cat "${script_path}/theme.rasi")

selected_option=$(printf "%s\n" "${sinks[@]}" | rofi -dmenu -p "Audio Output" -theme-str "${rofi_options}") 

for sink_id in "${!sinks[@]}"; do
    if [ "$selected_option" == "${sinks[$sink_id]}" ]; then
        pactl set-default-sink $sink_id
    fi 
done
