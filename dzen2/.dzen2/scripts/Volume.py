#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#        Filename: Volume.py
#     Description: Functions for volume
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-08-28 16:37:40
#        Modified: 2016-10-01 11:52:11
#
################################################################################
import linecache
import os
import subprocess
import sys
import time
sys.path.insert(0, os.environ['HOME'] + "/.dzen2/lib")
import Colors
import Icons

HEADP_F = "/proc/asound/card0/codec#0"  # Headphones File
HEADP_L = 163                           # Headphones Line


################################################################################
class Volume(object):
    """Functions for Volume.
    """
    def __get_headphones(self):
        """Prints the status of Headphones.
        """
        # Opening file containing current brightness
        try:
            headp_info = linecache.getline(HEADP_F, HEADP_L).strip()
        except:
            sys.stdout.write("^fg(%s)!E! HeadpFile^fg()" % Colors.CL_BASE08)

        return headp_info


    ############################################################################
    def __get_mute(self):
        """Prints the status of Mute.
        """
        # Executing command and parsing output
        cmd = subprocess.Popen(['amixer', 'get', 'Master'],\
            stdout=subprocess.PIPE)
        cmd_out, cmd_err = cmd.communicate()
        cmd_outparsed = cmd_out.split('\n')

        # Looking for Mute status
        for line in cmd_outparsed:
            if "Mono:" in line:
                mute_info = line.split('[')[3][:-1]
                return mute_info


    ############################################################################
    def __get_volume(self):
        """Prints the current volume level.
        """
        # Executing command and parsing output
        cmd = subprocess.Popen(['amixer', 'get', 'Master'],\
            stdout=subprocess.PIPE)
        cmd_out, cmd_err = cmd.communicate()
        cmd_outparsed = cmd_out.split('\n')

        # Looking for Volume
        for line in cmd_outparsed:
            if "Mono:" in line:
                volume_info = int(line.split(']')[0].split('[')[1][:-1])
                return volume_info


    ############################################################################
    def show_info(self):
        """Shows all information for Volume.
        """
        icon = Icons.Icons()               # Icon
        headp_on = "Pin-ctls: 0x00:"       # Headphones: Plugged
        headp_off = "Pin-ctls: 0x40: OUT"  # Headphones: Unplugged
        mute_on = "off"                    # Mute: ON
        mute_off = "on"                    # Mute: OFF

        # Getting information
        info_headp = self.__get_headphones()
        info_mute = self.__get_mute()
        info_volume = self.__get_volume()

        # Handling icon: Headphones: Plugged
        if info_headp == headp_on:
            icon.show_icon("headphones")
        # Handling icon: Headphones: Unplugged
        elif info_headp == headp_off:
            # Volume: 000 - 030
            if 0 <= info_volume <= 30:
                icon.show_icon("volume030")
            # Volume: 031 - 070
            elif 31 <= info_volume <= 70:
                icon.show_icon("volume070")
            # Volume: 071 - 100
            elif 71 <= info_volume <= 100:
                icon.show_icon("volume100")
        
        # Mute: ON
        if info_mute == mute_on:
            sys.stdout.write("^fg(%s)%s%%^fg()" %\
                (Colors.CL_BASE03, info_volume))
        # Mute: OFF
        elif info_mute == mute_off:
            # Volume: 000 - 060
            if 0 <= info_volume <= 60:
                sys.stdout.write("^fg(%s)%s%%^fg()" %\
                    (Colors.CL_BASE0B, info_volume))
            # Volume: 061 - 080
            elif 61 <= info_volume <= 80:
                sys.stdout.write("^fg(%s)%s%%^fg()" %\
                    (Colors.CL_BASE09, info_volume))
            # Volume: 081 - 100
            elif 81 <= info_volume <= 100:
                sys.stdout.write("^fg(%s)%s%%^fg()" %\
                    (Colors.CL_BASE08, info_volume))
