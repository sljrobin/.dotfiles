#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#        Filename: Os.py
#     Description: Functions for OS
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-08-28 23:09:04
#        Modified: 2016-08-30 01:18:27
#
################################################################################
import os
import sys
sys.path.insert(0, os.environ['HOME'] + "/.dzen2/lib")
import Colors


################################################################################
class Os(object):
    """Functions for OS.
    """
    def get_os(self):
        """Prints the current Operating System.
        """
        # Opening file containing information
        try:
            data_file = open("/proc/sys/kernel/osrelease")
            data = data_file.read().split()
            os_info = str(data)
            data_file.close()
        except:
            sys.stdout.write("^fg(%s)!E! OSFile^fg()" % Colors.CL_BASE08)

        # Looking for Arch / Debian
        if "ARCH" in os_info:
            sys.stdout.write("^fg(%s)A^fg()" % Colors.CL_BASE0D)
        if "Debian" in os_info:
            sys.stdout.write("^fg(%s)D^fg()" % Colors.CL_BASE0E)
