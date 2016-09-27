#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#        Filename: bar3_getter.py
#     Description: Bar 3 - Getter
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-08-28 17:51:57
#        Modified: 2016-09-19 01:43:21
#
################################################################################
import os
import sys
sys.path.insert(0, os.environ['HOME'] + "/.dzen2/scripts")
import Music
import Volume


################################################################################
def main():
    """Main function to get information for Bar 3.
    """
    getter_volume = Volume.Volume()
    getter_music = Music.Music()

    getter_volume.show_info()
    sys.stdout.write(" | ")
    getter_music.show_song()


################################################################################
if __name__ == "__main__":
    main()
