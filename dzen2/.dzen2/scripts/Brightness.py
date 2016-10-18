#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#        Filename: Brightness.py
#     Description: Functions for Brightness
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-08-28 23:28:13
#        Modified: 2016-09-02 13:25:38
#
################################################################################
import os
import sys
sys.path.insert(0, os.environ['HOME'] + "/.dzen2/lib")
import Colors
import Icons

BRIGHT_C = "/sys/class/backlight/intel_backlight/actual_brightness"
BRIGHT_M = "/sys/class/backlight/intel_backlight/max_brightness"


################################################################################
class Brightness(object):
    """Functions for Brightness.
    """
    def get_brightness(self):
        """Prints the current level of brightness.
        """
        icon = Icons.Icons()  # Icon

        # Opening file containing current brightness
        try:
            brightcur_file = open(BRIGHT_C)
            brightcur = brightcur_file.read()
            brightcur_file.close()
        except:
            sys.stdout.write("^fg(%s)!E! BrightCur^fg()" % Colors.CL_BASE08)

        # Opening file containing maximal brightness
        try:
            brightmax_file = open(BRIGHT_M)
            brightmax = brightmax_file.read()
            brightmax_file.close()
        except:
            sys.stdout.write("^fg(%s)!E! BrightMax^fg()" % Colors.CL_BASE08)

        # Casting into integers
        brightcur_level = int(brightcur)
        brightmax_level = int(brightmax)

        # Calculating brightness percentage and printing information
        brightness = (100 * brightcur_level) / brightmax_level
        icon.show_icon("brightness")        
        sys.stdout.write("%d%%" % brightness)
