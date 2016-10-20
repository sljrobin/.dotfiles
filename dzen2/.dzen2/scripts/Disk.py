#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#        Filename: Disk.py
#     Description: Functions for disk
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2017-09-28 11:48:03
#        Modified: 2016-10-09 21:28:28
#
################################################################################
import os
import subprocess
import sys
sys.path.insert(0, os.environ['HOME'] + "/.dzen2/lib")
import Colors
import Icons

DISK_DATA = "/dev/mapper/vg-axi0m_data"  # Disk's data
DISK_ROOT = "/dev/mapper/vg-axi0m_arch"  # Disk's root
DISKS = [DISK_DATA]                      # List of all the Disks


################################################################################
class Disk(object):
    """Funtions for Disk.
    """
    def __get_info(self, disk):
        """Prints a disk's name and its information.

        Args:
            disk: Disk to select.
        """
        # Checking the disk exists
	FNULL = open(os.devnull, 'w')  # Defining /dev/null
	check = subprocess.call(['df', disk], stdout=FNULL,\
            stderr=subprocess.STDOUT)
        # Disk not found
        if check != 0:
            sys.stdout.write("^fg(%s)!E! DiskNotFound^fg()" % Colors.CL_BASE08)
        # Disk found
        else:
            # Executing command, parsing output and removing empty elements
            cmd = subprocess.Popen(['df', '-H', disk], stdout=subprocess.PIPE)
            cmd_out, cmd_err = cmd.communicate()
            cmd_outparsed = cmd_out.split(' ')
            cmd_outparsed = filter(None, cmd_outparsed)

            # Getting information
            disk_name = disk
            disk_size = cmd_outparsed[7]
            disk_used = cmd_outparsed[8]
            disk_available = cmd_outparsed[9]
            disk_percentage = cmd_outparsed[10].translate(None, "%")
            disk_percentage = int(disk_percentage)

            # Disk Name: ~
            sys.stdout.write("^fg(%s)[^fg()" % Colors.CL_BASE02)
            if disk_name == DISK_DATA:
                sys.stdout.write("^fg(%s)~^fg()" % Colors.CL_BASE0D)
                sys.stdout.write("^fg(%s): ^fg()" % Colors.CL_BASE03)
            # Disk Name: /
            elif disk_name == DISK_ROOT:
                sys.stdout.write("^fg(%s)/^fg()" % Colors.CL_BASE0D)
                sys.stdout.write("^fg(%s): ^fg()" % Colors.CL_BASE03)
            
            # Disk Percentage: Good
            if 0 <= disk_percentage <= 60:
                sys.stdout.write("^fg(%s)%s%%^fg()" % (Colors.CL_BASE0B, disk_percentage))
                sys.stdout.write("^fg(%s) %s^fg()" % (Colors.CL_BASE0B, disk_used))
                sys.stdout.write("^fg(%s)/^fg()" % Colors.CL_BASE03)
            # Disk Percentage: Fair
            elif 61 <= disk_percentage <= 90:
                sys.stdout.write("^fg(%s)%s%%^fg()" % (Colors.CL_BASE09, disk_percentage))
                sys.stdout.write("^fg(%s) %s^fg()" % (Colors.CL_BASE09, disk_used))
                sys.stdout.write("^fg(%s)/^fg()" % Colors.CL_BASE03)
            # Disk Percentage: Weak
            elif 91 <= disk_percentage <= 100:
                sys.stdout.write("^fg(%s)%s%%^fg()" % (Colors.CL_BASE08, disk_percentage))
                sys.stdout.write("^fg(%s) %s^fg()" % (Colors.CL_BASE08, disk_used))
                sys.stdout.write("^fg(%s)/^fg()" % Colors.CL_BASE03)
            sys.stdout.write("^fg(%s)%s^fg()" % (Colors.CL_BASE0D, disk_size))
            sys.stdout.write("^fg(%s)]^fg()" % Colors.CL_BASE02)


    ############################################################################
    def show_disks(self):
        """Shows all the information about all the disks. 
        """
        icon = Icons.Icons()  # Icon

        # For every disk, listing information
        icon.show_icon("disk")
        for disk in DISKS:
            self.__get_info(disk)
