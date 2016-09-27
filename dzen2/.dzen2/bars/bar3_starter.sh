#!/bin/bash
#
#        Filename: bar3_starter.sh
#     Description: Bar 3 - Starter
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-06-28 17:15:54
#        Modified: 2016-09-01 13:44:06
#
################################################################################

while true;
do
  python2 $HOME/.dzen2/bars/bar3_getter.py
  echo -e ""
  sleep 1
done | /usr/local/bin/dzen2 -ta l -w 960 -x 0 -y 2000
