#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#        Filename: Battery.py
#     Description: Functions for Battery
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-08-29 23:02:39
#        Modified: 2016-09-11 21:23:35
#
################################################################################
import os
import subprocess
import sys
sys.path.insert(0, os.environ['HOME'] + "/.dzen2/lib")
import Colors
import Icons

AC = "/sys/class/power_supply/AC/online"             # AC
BAT0_F = "/sys/class/power_supply/BAT0/energy_full"  # Bat 0: Full
BAT0_N = "/sys/class/power_supply/BAT0/energy_now"   # Bat 0: Now
BAT1_F = "/sys/class/power_supply/BAT1/energy_full"  # Bat 1: Full
BAT1_N = "/sys/class/power_supply/BAT1/energy_now"   # Bat 1: Now


################################################################################
class Battery(object):
    """Functions for Battery.
    """
    def __get_ac(self):
        """Gets the status of AC.

        Returns:
            The value of the status. 1 if plugged, 0 otherwise.
        """
        # Opening file containing information
        try:
            data_file = open(AC)
            data = data_file.read().split()
            ac_info = str(data)\
                    .replace('[', '').replace(']', '').replace("'", '')
            data_file.close()
        except:
            sys.stdout.write("^fg(%s)!E! BatACFile^fg()" % Colors.CL_BASE08)

        return ac_info


    ############################################################################
    def __get_power(self, fnow, fful):
        """Gets Battery's percentage.

        Args:
            fnow: File for the Battery's power now.
            fful: File for the Battery's power full.

        Returns:
            Battery's percentage.
        """
        # Opening file containing information about Battery energy now
        try:
            batn_file = open(fnow)
            batn = batn_file.read().split()
            batn_info = str(batn)\
                    .replace('[', '').replace(']', '').replace("'", '')
            batn_file.close()
        except:
            sys.stdout.write("^fg(%s)!E! BatNow^fg()" % Colors.CL_BASE08)

        # Opening file containing information about Battery energy full
        try:
            batf_file = open(fful)
            batf = batf_file.read().split()
            batf_info = str(batf)\
                    .replace('[', '').replace(']', '').replace("'", '')
            batf_file.close()
        except:
            sys.stdout.write("^fg(%s)!E! BatFull^fg()" % Colors.CL_BASE08)

        # Calculating actual percentage
        bat_info = int((100 * int(batn_info)) / int(batf_info))

        return bat_info


    ############################################################################
    def __get_time(self):
        """Gets Battery's remaining time for charging or discharging.
        """
        # Executing command and parsing output
        cmd = subprocess.Popen(['acpi'], stdout=subprocess.PIPE)
        cmd_out, cmd_err = cmd.communicate()
        cmd_outparsed = cmd_out.split('\n')

        # Looking for Remaining time
        for line in cmd_outparsed:
            if "remaining" in line:
                time_info = line.split(' ')[4][:-3]
                return time_info
            elif "until charged" in line:
                time_info = line.split(' ')[4][:-3]
                return time_info


    ############################################################################
    def show_info(self):
        """Shows all information for Battery.
        """
        icon = Icons.Icons()  # Icon

        # Getting information
        info_ac = self.__get_ac()                     # AC
        info_bat0 = self.__get_power(BAT0_N, BAT0_F)  # Bat 0
        info_bat1 = self.__get_power(BAT1_N, BAT1_F)  # Bat 1
        info_batx = (info_bat0 + info_bat1) / 2       # Bat x
        info_time = self.__get_time()                 # Time

        # Handling icon: AC: ON
        if info_ac == '1':
            icon.show_icon("ac")        
        # Handling icon: AC: OFF
        elif info_ac == '0':
            # Battery power average: 000 - 009
            if 0 <= info_batx <= 9:
                icon.show_icon("battery010")
            # Battery power average: 010 - 019
            elif 10 <= info_batx <= 19:
                icon.show_icon("battery020")
            # Battery power average: 020 - 029
            elif 20 <= info_batx <= 29:
                icon.show_icon("battery030")
            # Battery power average: 030 - 039
            elif 30 <= info_batx <= 39:
                icon.show_icon("battery040")
            # Battery power average: 040 - 049
            elif 40 <= info_batx <= 49:
                icon.show_icon("battery050")
            # Battery power average: 050 - 059
            elif 50 <= info_batx <= 59:
                icon.show_icon("battery060")
            # Battery power average: 060 - 069
            elif 60 <= info_batx <= 69:
                icon.show_icon("battery070")
            # Battery power average: 070 - 079
            elif 70 <= info_batx <= 79:
                icon.show_icon("battery080")
            # Battery power average: 080 - 089
            elif 80 <= info_batx <= 89:
                icon.show_icon("battery090")
            # Battery power average: 090 - 100
            elif 90 <= info_batx <= 100:
                icon.show_icon("battery100")
            # Battery power average: case not handled
            else:
                sys.stdout.write("^fg(%s)!E! BatxTime^fg()" %\
                    Colors.CL_BASE08)
                icon.show_icon("ac")        

        # Battery's Time
        sys.stdout.write("^fg(%s)%s^fg()" % (Colors.CL_BASE04, info_time))
        sys.stdout.write(" ")

        # Battery 0: 000% - 010%
        if 0 <= info_bat0 <= 10:
            sys.stdout.write("^fg(%s)%s%%^fg()" %\
                (Colors.CL_BASE08, info_bat0))
        # Battery 0: 011% - 035%
        elif 11 <= info_bat0 <= 35:
            sys.stdout.write("^fg(%s)%s%%^fg()" %\
                (Colors.CL_BASE09, info_bat0))
        # Battery 0: 036% - 075%
        elif 36 <= info_bat0 <= 75:
            sys.stdout.write("^fg(%s)%s%%^fg()" %\
                (Colors.CL_BASE0D, info_bat0))
        # Battery 0: 076% - 100%
        elif 76 <= info_bat0 <= 100:
            sys.stdout.write("^fg(%s)%s%%^fg()" %\
                (Colors.CL_BASE0B, info_bat0))
        # Battery 0: Case not handled
        else:
            sys.stdout.write("^fg(%s)!E! Bat0Per^fg()" % Colors.CL_BASE08)

        sys.stdout.write(" ")

        # Battery 1: 000% - 010%
        if 0 <= info_bat1 <= 10:
            sys.stdout.write("^fg(%s)%s%%^fg()" %\
                (Colors.CL_BASE08, info_bat1))
        # Battery 1: 011% - 035%
        elif 11 <= info_bat1 <= 35:
            sys.stdout.write("^fg(%s)%s%%^fg()" %\
                (Colors.CL_BASE09, info_bat1))
        # Battery 1: 036% - 075%
        elif 36 <= info_bat1 <= 75:
            sys.stdout.write("^fg(%s)%s%%^fg()" %\
                (Colors.CL_BASE0D, info_bat1))
        # Battery 1: 076% - 100%
        elif 76 <= info_bat1 <= 100:
            sys.stdout.write("^fg(%s)%s%%^fg()" %\
                (Colors.CL_BASE0B, info_bat1))
        # Battery 1: Case not handled
        else:
            sys.stdout.write("^fg(%s)!E! Bat1Per^fg()" % Colors.CL_BASE08)
