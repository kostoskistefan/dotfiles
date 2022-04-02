#!/bin/sh

options=("Shutdown" "Restart" "Suspend" "Log Out")

script_path=$(cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P)
rofi_options=$(cat "${script_path}/theme.rasi")

selected_option=$(printf "%s\n" "${options[@]}" | rofi -dmenu -p "Session" -theme-str "${rofi_options}")

case $selected_option in
    "Shutdown")
        systemctl poweroff;;
    "Restart")
        systemctl reboot;;
    "Suspend")
        systemctl suspend;;
    "Log Out")
        loginctl terminate-session ${XDG_SESSION_ID-};;
esac
