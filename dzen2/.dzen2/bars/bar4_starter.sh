#!/bin/bash
#
#        Filename: bar4_starter.sh
#     Description: Bar 4 - Starter
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-06-28 17:15:54
#        Modified: 2016-09-01 13:36:22
#
################################################################################

while true;
do
  python2 $HOME/.dzen2/bars/bar4_getter.py
  echo -e ""
  sleep 1
done | /usr/local/bin/dzen2 -ta r -w 960 -x 960 -y 2000
