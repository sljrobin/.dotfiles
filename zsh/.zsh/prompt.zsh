#!/bin/zsh
#
#        Filename: prompt.zsh
#     Description: Zsh | Prompt
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-01-18 16:15:50
#        Modified: 2016-04-15 17:45:18
#
########################################################################################################################
# Prompt | Set parameters
function __zsh_prompt_set()
{
  # `%n`: name
  # `%m`: hostname
  # `%~`: current working directory
  #
  # Prompt User: <name>@<hostname>:<path>%
  # Prompt Root: <name>@<hostname>:<path>#
  #
  # Syntax for color: %F{color} [...] %f

  local prompt_cdir="%F{blue}%~%f"     # Prompt | Current directory
  local prompt_host="%F{yellow}%m%f"   # Prompt | Hostname
  local prompt_name="%F{red}%n%f"      # Prompt | Name

  PROMPT="$prompt_name@$prompt_host:$prompt_cdir%# "
}


################################################################################
# Prompt | Main
function zsh_prompt()
{
  __zsh_prompt_set
}


########################################################################################################################
zsh_prompt

# TODO
# if not empty (  who am i | cut -f2 -d\( | cut -f1 -d: ) then we are under an ssh connection

