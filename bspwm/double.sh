#!/bin/bash
#
#   double borders
#

outer='0x292225'   # outer
inner1='0xebd6c6'  # focused
inner2='0x6B5C65'  # normal

targets() {
	case $1 in
		focused) bspc query -N -n .local.focused.\!fullscreen;;
		normal)  bspc query -N -n .local.\!focused.\!fullscreen
	esac | grep -iv "$v"
}
bspc config border_width 12

draw() { chwb2 -I "$inner" -O "$outer" -i "2" -o "9" $* |:; }

# initial draw, and then subscribe to events
{ echo; bspc subscribe node_geometry node_focus; } |
	while read -r _; do
		v=$(echo $(xdo id -N Firefox))
		v=${v// /\\|}
		[ "$v" ] || v='abcdefg'
		inner=$inner1 draw "$(targets focused)"
		inner=$inner2 draw "$(targets  normal)"
	done
