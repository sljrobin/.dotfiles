#!/bin/sh
#
#        Filename: .xinitrc.sh
#     Description: Set up a X environment
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-04-10 03:54:12
#        Modified: 2016-04-10 03:54:42
#
################################################################################
#
# Command examples
#   * xinit: will start the default <GUI> 
#   * xinit <GUI>: will start <GUI>
# or
#   * startx
#   * startx ~/.xinitrc <GUI>
#
################################################################################
# Default GUI
session=${1:-xmonad}

# Selection
case $session in
  xmonad ) exec ~/.xinitrc.d/xmonad;;  # xmonad
  *      ) exec $1;;                   # Unknown session, try to run it as a command
esac
