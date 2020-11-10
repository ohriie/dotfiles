#!/bin/bash

rofi_command="rofi -theme themes/appsmenu.rasi"

#### Options ###
theme=" Theme"
network="直 Network"
rpi=" Raspberry"
mount=" Mount"
# Variable passed to rofi
options="$theme\n$mount\n$network\n$rpi"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0)"
case $chosen in
    $theme)
        bash $HOME/.config/rofi/scripts/walmenu.sh
        ;;    
    $network)
        bash $HOME/.cache/networkmenu.sh
        ;;
    $rpi)
        bash $HOME/.cache/rpi.sh
        ;;
    $mount)
        sudo -A bash $HOME/.config/rofi/scripts/mntmenu.sh
esac

