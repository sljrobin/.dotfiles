#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#        Filename: Clock.py
#     Description: Functions for Clock
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-08-28 20:18:20
#        Modified: 2016-08-30 01:18:05
#
################################################################################
import datetime
import os
import sys
import time
sys.path.insert(0, os.environ['HOME'] + "/.dzen2/lib")
import Colors
import Icons


################################################################################
class Clock(object):
    """Functions for Time.
    """
    def get_date(self):
        """Prints the current date.
        """
        icon = Icons.Icons()                                     # Icon
        current_date = time.strftime("%d/%m/%Y", time.gmtime())  # Current date

        icon.show_icon("calendar")
        sys.stdout.write("%s" % current_date)


    ############################################################################
    def get_time(self):
        """Prints the current time.
        """
        icon = Icons.Icons()                                     # Icon
        current_time = time.strftime("%H:%M:%S", time.gmtime())  # Current time

        icon.show_icon("clock")
        sys.stdout.write("%s" % current_time)


    ############################################################################
    def get_uptime(self):
        """Prints the current uptime.
        """
        icon = Icons.Icons()  # Icon
        unit_m = 60           # Unit: Minute
        unit_h = unit_m * 60  # Unit: Hour
        unit_d = unit_h * 24  # Unit: Day

        # Opening file containing information
        try:
            data_file = open("/proc/uptime")
            data = data_file.read().split()
            data_file.close()
        except:
            sys.stdout.write("^fg(%s)!E! UptimeFile^fg()" % Colors.CL_BASE08)

        # Selecting information
        value = float(data[0])

        # Casting in good time units
        value_d = int(value / unit_d)
        value_h = int((value % unit_d) / unit_h)
        value_m = int((value % unit_h) / unit_m)
        value_s = int(value % unit_m)

        # Adding leading zeros
        value_d_fmt = str(value_d).zfill(2)
        value_h_fmt = str(value_h).zfill(2)
        value_m_fmt = str(value_m).zfill(2)
        value_s_fmt = str(value_s).zfill(2)

        # Printing information
        icon.show_icon("uptime")
        sys.stdout.write("%s:" % value_d_fmt)
        sys.stdout.write("%s:" % value_h_fmt)
        sys.stdout.write("%s:" % value_m_fmt)
        sys.stdout.write("%s" % value_s_fmt)
