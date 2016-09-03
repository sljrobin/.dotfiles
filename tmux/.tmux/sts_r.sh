#!/bin/bash
#
#        Filename: sts_r.sh
#     Description: tmux | Status Bar | Right
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-04-15 22:35:45
#        Modified: 2016-04-15 23:07:32
#
################################################################################
# Pane in mode
echo -n "#[fg=colour4]"         # Pane in mode | Foreground
echo -n "⚑"                     # Pane in mode | Symbol
echo -n "#[fg=colour20]"        # Pane in mode | Reset
echo -n ":"                     # Pane in mode | Separator
echo -n "#[fg=colour4]"         # Pane in mode | Foreground
echo -n "#{pane_in_mode}"       # Pane in mode | Value
echo -n "#[fg=colour20]"        # Pane in mode | Reset

# Separator
echo -n "•"                     # Separator | Symbol

# Pane synchronized
echo -n "#[fg=colour5]"         # Pane synchronized | Foreground
echo -n "↯"                     # Pane synchronized | Symbol
echo -n "#[fg=colour20]"        # Pane synchronized | Reset
echo -n ":"                     # Pane synchronized | Separator
echo -n "#[fg=colour5]"         # Pane synchronized | Foreground
echo -n "#{pane_synchronized}"  # Pane synchronized | Value
