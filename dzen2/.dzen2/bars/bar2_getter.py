#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#        Filename: bar2_getter.py
#     Description: Bar 2 - Getter
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-08-28 23:57:47
#        Modified: 2016-10-09 21:27:50
#
################################################################################
import os
import sys
sys.path.insert(0, os.environ['HOME'] + "/.dzen2/scripts")
import Brightness
import Disk
import Internet


################################################################################
def main():
    """Main function to get information for Bar 2.
    """
    getter_brightness = Brightness.Brightness()
    getter_disk = Disk.Disk()
    getter_internet = Internet.Internet()

    getter_disk.show_disks()
    sys.stdout.write(" | ")
    getter_internet.get_internet_device()
    getter_internet.show_wifi()
    sys.stdout.write(" | ")
    getter_brightness.get_brightness()


################################################################################
if __name__ == "__main__":
    main()
