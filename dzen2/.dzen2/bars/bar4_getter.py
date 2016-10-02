#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#        Filename: bar4_getter.py
#     Description: Bar 4 - Getter
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-08-29 00:04:59
#        Modified: 2016-09-19 01:43:22
#
################################################################################
import os
import sys
sys.path.insert(0, os.environ['HOME'] + "/.dzen2/scripts")
import Battery
import Clock
import Keyboard
import Os


################################################################################
def main():
    """Main function to get information for Bar 4.
    """
    getter_battery = Battery.Battery()
    getter_clock = Clock.Clock()
    getter_keyboard = Keyboard.Keyboard()
    getter_os = Os.Os()
    
    getter_battery.show_info()
    sys.stdout.write(" | ")
    getter_clock.get_uptime()
    sys.stdout.write(" | ")
    getter_clock.get_time()
    sys.stdout.write("  ")
    getter_clock.get_date()
    sys.stdout.write(" | ")
    getter_keyboard.get_layout()
    getter_keyboard.show_locks()
    sys.stdout.write(" | ")
    getter_os.get_os()


################################################################################
if __name__ == "__main__":
    main()
