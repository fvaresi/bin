#!/bin/bash

# Based on https://github.com/carnager/rofi-scripts/blob/master/i3_switch_workspace.sh

function gen_workspaces()
{
    i3-msg -t get_workspaces | tr ',' '\n' | grep "name" | sed 's/"name":"\(.*\)"/\1/g' | sort -n
}


WORKSPACE=$( gen_workspaces  | rofi -dmenu -p "Select workspace:")

if [ -n "${WORKSPACE}" ]
then
    i3-save-tree --workspace "${WORKSPACE}" > ~/.i3/workspaces/${WORKSPACE}.json
fi
