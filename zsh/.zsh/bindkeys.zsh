#!/bin/zsh
#
#        Filename: bindkeys.zsh
#     Description: Zsh | Bindkeys
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-01-18 17:17:38
#        Modified: 2016-01-18 17:27:27
#
########################################################################################################################
# Bindkeys | For characters
function __zsh_bindkeys_chars()
{
  bindkey '\e[3~' delete-char  # <Delete>: delete a character
}


################################################################################
# Bindkeys | For lines
function __zsh_bindkeys_lines()
{
  bindkey '\e[7~' beginning-of-line  # <Home>: go to the beginning of the line
  bindkey '\e[8~' end-of-line        # <End>: go to the end of the line
}


################################################################################
# Bindkeys | For miscellaneous purposes
function __zsh_bindkeys_misc()
{
  bindkey '\e[Z' reverse-menu-complete  # <Shift> + <Tab>: backward tab
}


################################################################################
# Bindkeys | For words
function __zsh_bindkeys_words()
{
  bindkey '\e[1;5C' forward-word   # <Ctrl> + <Right>: forward word
  bindkey '\e[1;5D' backward-word  # <Ctrl> + <Left>: backward word
}


################################################################################
# Bindkeys | Main
function zsh_bindkeys()
{
  __zsh_bindkeys_chars
  __zsh_bindkeys_lines
  __zsh_bindkeys_misc
  __zsh_bindkeys_words
}


########################################################################################################################
zsh_bindkeys
