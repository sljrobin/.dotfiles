#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#        Filename: Internet.py
#     Description: Functions for Internet
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-09-10 15:39:39
#        Modified: 2016-11-09 15:16:25
#
################################################################################
import os
import subprocess
import sys
sys.path.insert(0, os.environ['HOME'] + "/.dzen2/lib")
import Colors
import Icons

DEV_WIRELESS = ['wlan0', 'wlp3s0']              # Devices Wireless (Internal)
DEV_WIRELESS_ALFA = ['wlp0s20u1', 'wlp0s20u2']  # Devices Wireless (External)
DEV_WIRING = ['eth0', 'enp0s25']                # Devices Wiring


################################################################################
class Internet(object):
    """Functions for Internet.
    """
    def get_internet_device(self):
        """Gets the Internet devices status.
        """
        icon = Icons.Icons()  # Icon

        # Device names which might be used by the OS
        devices_wireless = DEV_WIRELESS
        devices_wireless_alfa = DEV_WIRELESS_ALFA
        devices_wiring = DEV_WIRING
        devices = devices_wireless + devices_wireless_alfa + devices_wiring

        # Executing command and parsing output
        cmd = subprocess.Popen(['ip', 'link'], stdout=subprocess.PIPE)
        cmd_out, cmd_err = cmd.communicate()

        # Looking for device statuses
        for device in devices:
            if device in cmd_out:
                cmddev = subprocess.Popen(['ip', 'addr', 'show', device], stdout=subprocess.PIPE)
                cmddev_out, cmddev_err = cmddev.communicate()
                cmddev_outparsed = str(cmddev_out).split(' ')
                status = cmddev_outparsed[8]

                # Ethernet device
                if device in devices_wiring:
                    if status == "UP":
                        icon.show_icon("ethernet")
                # Alfa antenna
                if device in devices_wireless_alfa:
                    if status == "UP":
                        icon.show_icon("alfa")
                # Internal WiFi chip
                if device in devices_wireless:
                    if status == "UP":
                        icon.show_icon("cpu")


    ############################################################################
    def __get_wifi_device(self):
        """Gets the WiFi device used.
        """
        # Device names which might be used by the OS
        devices_wireless = DEV_WIRELESS
        devices_wireless_alfa = DEV_WIRELESS_ALFA
        devices = devices_wireless + devices_wireless_alfa

        # Executing command and parsing output
        cmd = subprocess.Popen(['ip', 'link'], stdout=subprocess.PIPE)
        cmd_out, cmd_err = cmd.communicate()

        # Looking for device statuses
        for device in devices:
            if device in cmd_out:
                cmddev = subprocess.Popen(['ip', 'addr', 'show', device], stdout=subprocess.PIPE)
                cmddev_out, cmddev_err = cmddev.communicate()
                cmddev_outparsed = str(cmddev_out).split(' ')
                status = cmddev_outparsed[8]

                # Alfa antenna
                if device in devices_wireless_alfa:
                    if status == "UP":
                        return device
                # Internal WiFi chip
                if device in devices_wireless:
                    if status == "UP":
                        return device


    ############################################################################
    def __get_wifi_essid(self, line):
        """Gets WiFi ESSID.

        Args:
            line: Line to parse to get the information.

        Returns:
            WiFi ESSID.
        """
        essid = line.split(':')[1].replace('"', "").replace("\n", "").strip()
        return essid


    ############################################################################
    def __get_wifi_percentage_average(self, quality, signal):
        """Gets WiFi percentage average.

        Args:
            quality: WiFi quality.
            signal: WiFi signal.
        """
        icon = Icons.Icons()              # Icon
        average = (quality + signal) / 2  # Average
        
        # Average: Useless
        if 0 <= average <= 19:
            icon.show_icon("wifi1")
        # Average: Weak
        elif 20 <= average <= 39:
            icon.show_icon("wifi2")
        # Average: Fair
        elif 40 <= average <= 59:
            icon.show_icon("wifi3")
        # Average: Good
        elif 60 <= average <= 79:
            icon.show_icon("wifi4")
        # Average: Excellent
        elif 80 <= average <= 100:
            icon.show_icon("wifi5")


    ############################################################################
    def __get_wifi_quality(self, line):
        """Gets WiFi quality.

        Args:
            line: Line to parse to get the information.

        Returns:
            WiFi quality.
        """
        quality_cur = int(line.split('/')[0].split('=')[1])
        quality_max = int(line.split('/')[1].split(' ')[0])
        quality = (quality_cur * 100) / quality_max
        return quality


    ############################################################################
    def __get_wifi_signal(self, line):
        """Gets WiFi signal.

        Args:
            line: Line to parse to get the information.

        Returns:
            WiFi signal.
        """
        signal_max = 100
        signal_cur = int(line.split('-')[1].split(' ')[0])
        signal = signal_max - signal_cur
        return signal


    ############################################################################
    def __get_wifi_signal_dbm(self, line):
        """Gets WiFi signal in dBm.

        Args:
            line: Line to parse to get the information.

        Returns:
            WiFi signal in dBm.
        """
        signal_dbm = int(line.split('-')[1].split(' ')[0])
        return signal_dbm


    ############################################################################
    def __get_wifi_unsecured_networks(self, device):
	"""Detects Unsecured WiFi networks.

	Args:
	    device: WiFi device to use to scan.
	"""
        wifi_networks_counter = 0  # Total of unsecured networks found

        cmd = subprocess.Popen(['/sbin/iwlist', device, 'scan'],\
            stdout=subprocess.PIPE)
        cmd_out, cmd_err = cmd.communicate()
        cmd_outparsed = str(cmd_out).split(' ')

        #print cmd_outparsed[90]

        # Looking for unsecured WiFi networks
        for line in cmd_outparsed:
            if "Encryption key:off":
                wifi_networks_counter += 1

        #print wifi_networks_counter


    ############################################################################
    def show_wifi(self):
        """Handles all the information about WiFi.
        """
        icon = Icons.Icons()  # Icon

        # Getting WiFi Device and checking there is an existing one
        wifi_device = self.__get_wifi_device()
        # No device
        if wifi_device == None:
            icon.show_icon("offline")
        # Device found
        else:
            # Getting unsecured networks
            #self.__get_wifi_unsecured_networks(wifi_device)

            # Executing command and parsing output
            cmd = subprocess.Popen(['/sbin/iwconfig', wifi_device],\
                stdout=subprocess.PIPE)
            cmd_out, cmd_err = cmd.communicate()
            cmd_outparsed = cmd_out.split('\n')
            
            # Looking for WiFi information
            for line in cmd_outparsed:
                if "ESSID" in line:
                    wifi_essid = self.__get_wifi_essid(line)
                if "Link Quality" in line:
                    wifi_quality = self.__get_wifi_quality(line)
                if "Signal level" in line:
                    wifi_signal = self.__get_wifi_signal(line)
                    wifi_signal_dbm = self.__get_wifi_signal_dbm(line)

            # ESSID
            if wifi_essid == "off/any":
                sys.stdout.write("")
            else:
                sys.stdout.write("^fg(%s) [^fg()^fg(%s)%s^fg()^fg(%s)]  ^fg()" %\
                    (Colors.CL_BASE02,\
                     Colors.CL_BASE0E, wifi_essid,\
                     Colors.CL_BASE02))

            # Average
            self.__get_wifi_percentage_average(wifi_quality, wifi_signal)

            # Signal: Fair
            if 0 <= wifi_signal <= 29:
                sys.stdout.write("^fg(%s)%s%%^fg() " %\
                    (Colors.CL_BASE08, wifi_signal))
                sys.stdout.write("^fg(%s)[^fg()^fg(%s)%s dBm^fg()^fg(%s)]^fg()" %\
                    (Colors.CL_BASE02,\
                     Colors.CL_BASE03, wifi_signal_dbm,\
                     Colors.CL_BASE02))
            # Signal: Good
            elif 30 <= wifi_quality <= 39:
                sys.stdout.write("^fg(%s)%s%%^fg() " %\
                    (Colors.CL_BASE0D, wifi_signal))
                sys.stdout.write("^fg(%s)[^fg()^fg(%s)%s dBm^fg()^fg(%s)]^fg()" %\
                    (Colors.CL_BASE02,\
                     Colors.CL_BASE03, wifi_signal_dbm,\
                     Colors.CL_BASE02))
            # Signal: Excellent
            elif 40 <= wifi_quality <= 100:
                sys.stdout.write("^fg(%s)%s%%^fg() " %\
                    (Colors.CL_BASE0B, wifi_signal))
                sys.stdout.write("^fg(%s)[^fg()^fg(%s)%s dBm^fg()^fg(%s)]^fg()" %\
                    (Colors.CL_BASE02,\
                     Colors.CL_BASE03, wifi_signal_dbm,\
                     Colors.CL_BASE02))

            sys.stdout.write("^fg(%s) / ^fg()" % Colors.CL_BASE04)

            # Link Quality: Fair
            if 0 <= wifi_quality <= 49:
                sys.stdout.write("^fg(%s)%s%%^fg()" %\
                    (Colors.CL_BASE08, wifi_quality))
            # Link Quality: Good
            elif 50 <= wifi_quality <= 79:
                sys.stdout.write("^fg(%s)%s%%^fg()" %\
                    (Colors.CL_BASE0D, wifi_quality))
            # Link Quality: Excellent
            elif 80 <= wifi_quality <= 100:
                sys.stdout.write("^fg(%s)%s%%^fg()" %\
                    (Colors.CL_BASE0B, wifi_quality))

#internet = Internet()
#internet.show_wifi()
