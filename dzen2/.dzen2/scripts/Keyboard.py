#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#        Filename: Keyboard.py
#     Description: Functions for Keyboard
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-08-30 00:14:31
#        Modified: 2016-08-30 01:18:13
#
################################################################################
import os
import subprocess
import sys
sys.path.insert(0, os.environ['HOME'] + "/.dzen2/lib")
import Colors
import Icons


################################################################################
class Keyboard(object):
    """Functions for Keyboard.
    """
    def __get_lock_caps(self):
        """Prints the status of Caps Lock.

        Returns:
            Status of Caps Lock.
        """
        # Executing command and parsing output
        cmd = subprocess.Popen(['xset', 'q'], stdout=subprocess.PIPE)
        cmd_out, cmd_err = cmd.communicate()
        cmd_outparsed = cmd_out.split('\n')

        # Looking for Caps Lock status
        for line in cmd_outparsed:
            if "Caps Lock" in line:
                lock_caps = line.split('   ')[2].replace(' ', '')
                return lock_caps


    ############################################################################
    def __get_lock_num(self):
        """Prints the status of Num Lock.

        Returns:
            Status of Num Lock.
        """
        # Executing command and parsing output
        cmd = subprocess.Popen(['xset', 'q'], stdout=subprocess.PIPE)
        cmd_out, cmd_err = cmd.communicate()
        cmd_outparsed = cmd_out.split('\n')

        # Looking for Num Lock status
        for line in cmd_outparsed:
            if "Num Lock" in line:
                lock_num = line.split('   ')[4].replace(' ', '')
                return lock_num


    ############################################################################
    def get_layout(self):
        """Prints the current keyboard layout.
        """
        # Executing command and parsing output
        cmd = subprocess.Popen(['setxkbmap', '-print'], stdout=subprocess.PIPE)
        cmd_out, cmd_err = cmd.communicate()
        cmd_outparsed = cmd_out.split('\n')

	# Looking for Keyboard Layout and printing it
        for line in cmd_outparsed:
            if "xkb_symbols" in line: 
                layout = line.split('+')[1]
                sys.stdout.write("%s" % layout)


    ############################################################################
    def show_locks(self):
        """Handles all the Lock status.
        """
        lock_caps = self.__get_lock_caps()  # Get Lock Caps
        lock_num = self.__get_lock_num()    # Get Lock Num
        
        # Caps Lock: ON + Num Lock: ON
        if lock_caps == "on" and lock_num == "on":
            sys.stdout.write("^fg(%s) N^fg()" % Colors.CL_BASE0B)
            sys.stdout.write("^fg(%s)C^fg()" % Colors.CL_BASE09)
        # Caps Lock: ON
        elif lock_caps == "on":
            sys.stdout.write("^fg(%s) C^fg()" % Colors.CL_BASE09)
        # Num Lock: ON
        elif lock_num == "on":
            sys.stdout.write("^fg(%s) N^fg()" % Colors.CL_BASE0B)
