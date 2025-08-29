#!/bin/sh
# Adapte os ícones se não estiver usando Nerd Fonts

chosen=$(printf " Power Off\n Restart\n Suspend\n Lock\n Logout" | rofi -dmenu -i -p "Power Menu")

case "$chosen" in
    " Power Off") poweroff ;;
    " Restart") reboot ;;
    " Suspend") systemctl suspend ;;
    " Lock") i3lock -c 000000 ;; # Instale o i3lock se não tiver
    " Logout") i3-msg exit ;;
    *) exit 1 ;;
esac
