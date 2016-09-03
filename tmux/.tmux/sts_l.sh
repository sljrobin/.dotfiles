#!/bin/bash
#
#        Filename: sts_l.sh
#     Description: tmux | Status Bar | Left
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-04-15 22:52:23
#        Modified: 2016-05-06 21:58:07
#
################################################################################
# Session
echo -n "#[fg=colour2]"                  # Session | Foreground
echo -n "#S"                             # Session | Value
echo -n "#[fg=colour20]"                 # Session | Reset
echo -n "["                              # Session | Separator
echo -n "#[fg=colour2]"                  # Session | Foreground
echo -n "$(tmux list-sessions | wc -l)"  # Session | Value
echo -n "#[fg=colour20]"                 # Session | Reset
echo -n "]"                              # Session | Separator

# Separator
echo -n "•"                              # Separator | Symbol

# Window
echo -n "#[fg=colour1]"                  # Window | Foreground
echo -n "#I"                             # Window | Value (Current)
echo -n "#[fg=colour20]"                 # Window | Reset
echo -n "/"                              # Window | Separator
echo -n "#[fg=colour1]"                  # Window | Foreground
echo -n "#{session_windows}"             # Window | Value (Total)
echo -n "#[fg=colour20]"                 # Window | Reset

# Separator
echo -n "•"                              # Separator | Symbol

# Pane
echo -n "#[fg=colour3]"                  # Pane | Foreground
echo -n "#P"                             # Pane | Value (Current)
echo -n "#[fg=colour20]"                 # Pane | Reset
echo -n "/"                              # Pane | Separator
echo -n "#[fg=colour3]"                  # Pane | Foreground
echo -n "#{window_panes}"                # Pane | Value (Total)
echo -n "#[fg=colour20]"                 # Pane | Reset

