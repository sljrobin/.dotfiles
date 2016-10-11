#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#        Filename: Icons.py
#     Description: Functions for icons
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-08-28 16:27:54
#        Modified: 2016-08-29 00:07:03
#
################################################################################
import os
import sys


################################################################################
class Icons(object):
    """Class for Icons.
    """
    def show_icon(self, icon):
        """Shows an icon.

        Args:
            icon: The icon to show.
        """
        extension = ".xbm"                            # Icon extension
        out = ")"                                     # Matching bracket
        path = os.environ['HOME'] + "/.dzen2/icons/"  # Path to Icons
        prefix = "^i("                                # Icon prefix

        sys.stdout.write(prefix + path + str(icon) + extension + out + ' ')
