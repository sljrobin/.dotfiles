#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#        Filename: Music.py
#     Description: Functions for Music
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-09-11 22:50:11
#        Modified: 2016-09-25 23:50:25
#
################################################################################
import os
import subprocess
import sys
sys.path.insert(0, os.environ['HOME'] + "/.dzen2/lib")
import Colors
import Icons


################################################################################
class Music(object):
    """Functions for Music.
    """
    def __format_metadata(self, color_artist, color_title, color_album,\
                          color_percentage, color_repeat, color_random):
        """Formats the song's metadata for printing.

        Args:
            color_artist: Artist's color.
            color_title: Title's color.
            color_album: Album's color.
            color_percentage: Percentage's color.
            color_repeat: Repeat's color.
            color_random: Random's color.
        """
        # Getting song's metadata
        song_metadata = self.__get_metadata()  # Metadata list
        song_artist = song_metadata[0]         # Artist
        song_album = song_metadata[1]          # Album
        song_title = song_metadata[2]          # Title
        song_time = song_metadata[3]           # Time
        song_percentage = song_metadata[4]     # Percentage
        song_repeat = song_metadata[5]         # Repeat
        song_random = song_metadata[6]         # Random

        # Artist
        sys.stdout.write("^fg(%s)[^fg()" % Colors.CL_BASE03)
        sys.stdout.write("^fg(%s)%s^fg()" % (color_artist, song_artist))
        sys.stdout.write("^fg(%s)][^fg()" % Colors.CL_BASE03)
        # Title
        sys.stdout.write("^fg(%s)%s^fg()" % (color_title, song_title))
        sys.stdout.write("^fg(%s)][^fg()" % Colors.CL_BASE03)
        # Album
        sys.stdout.write("^fg(%s)%s^fg()" % (color_album, song_album))
        sys.stdout.write("^fg(%s)][^fg()" % Colors.CL_BASE03)
        # Time / Percentage
        sys.stdout.write("^fg(%s)%s %s%%^fg()" % (color_percentage,\
            song_time, song_percentage))
        sys.stdout.write("^fg(%s)]^fg()" % Colors.CL_BASE03)
        # Repeat
        if song_repeat != "off":
            sys.stdout.write("^fg(%s)[^fg()" % Colors.CL_BASE03)
            sys.stdout.write("^fg(%s)R^fg()" % color_repeat)
            sys.stdout.write("^fg(%s)]^fg()" % Colors.CL_BASE03)
        # Random
        if song_random != "off":
            sys.stdout.write("^fg(%s)[^fg()" % Colors.CL_BASE03)
            sys.stdout.write("^fg(%s)~^fg()" % color_random)
            sys.stdout.write("^fg(%s)]^fg()" % Colors.CL_BASE03)


    ############################################################################
    def __get_metadata(self):
        """Gets the song's metadata.

        Returns:
            Song's metadata.
        """
        # Executing command and parsing output
        metadata_format = '%artist%\\n%album%\\n%title%\\n%track%'
        cmd = subprocess.Popen(['mpc', '--format', metadata_format],\
            stdout=subprocess.PIPE)
        cmd_out, cmd_err = cmd.communicate()
        cmd_outparsed = cmd_out.split('\n')

        # Getting status
        status = self.__get_music_status()

        # Getting Artist / Album / Title
        artist = cmd_outparsed[0]
        album = cmd_outparsed[1]
        title = cmd_outparsed[2]

        # Gettting Time / Percentage / Repeat / Random
        for line in cmd_outparsed:
            if "#" in line:
                # Time
                if status == "playing":
                    time = line.split(' ')[4]
                elif status == "paused":
                    time = line.split(' ')[5]
                # Percentage
                if status == "playing":
                    percentage = line.split(' ')[5].translate(None, "()%")
                elif status == "paused":
                    percentage = line.split(' ')[6].translate(None, "()%")
            if "volume" in line:
                # Repeat
                repeat = line.split(' ')[5]
                # Random
                random = line.split(' ')[9]
        
        # Parsing metadata
        metadata = [artist, album, title,\
                    time, percentage,\
                    repeat, random]

        return metadata


    ############################################################################
    def __get_music_status(self):
        """Gets MPC status.

        Returns:
            MPC status.
        """
        # Executing command and parsing output
        cmd = subprocess.Popen(['mpc'], stdout=subprocess.PIPE)
        cmd_out, cmd_err = cmd.communicate()
        cmd_outparsed = cmd_out.split('\n')

        # Looking for MPC status
        status_line = cmd_outparsed[1]
        for line in cmd_outparsed:
            if "playing" in status_line:
                status = "playing"
                return status
            elif "paused" in status_line:
                status = "paused"
                return status
            else:
                status = "stopped"
                return status


    ############################################################################
    def show_song(self):
        """Shows information about the current playing song.
        """
        icon = Icons.Icons()  # Icon

        # Getting status
        status = self.__get_music_status()
        if status == "playing":
            icon.show_icon("music_play")
            self.__format_metadata(Colors.CL_BASE0B, Colors.CL_BASE0D,\
                                   Colors.CL_BASE0A, Colors.CL_BASE08,\
                                   Colors.CL_BASE09, Colors.CL_BASE0E)
        elif status == "paused":
            icon.show_icon("music_pause")
            self.__format_metadata(Colors.CL_BASE04, Colors.CL_BASE04,\
                                   Colors.CL_BASE04, Colors.CL_BASE04,\
                                   Colors.CL_BASE04, Colors.CL_BASE04)
        else:
            icon.show_icon("music_stop")
