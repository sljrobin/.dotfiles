source ~/.zsh/aliases.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/colors.zsh
source ~/.zsh/prompt.zsh


autoload -U colors && colors

setopt AUTOCD # Change directory without typing the `cd` command

setopt INC_APPEND_HISTORY # Commands are added to the history as soon as they are entered

setopt SHARE_HISTORY # Reload the history for every new session

setopt RM_STAR_WAIT  # Give a sanity check before removing everyhting

unsetopt MENU_COMPLETE # Do not insert the first match immediately 

autoload select-word-style
select-word-style bash  # Allow `_` like a ` ` to select words




function check_last_exit_code() {
  local LAST_EXIT_CODE=$?
  if [[ $LAST_EXIT_CODE -ne 0 ]]; then
    local EXIT_CODE_PROMPT=' '
    EXIT_CODE_PROMPT+="%{$fg[red]%}-%{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg_bold[red]%}$LAST_EXIT_CODE%{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg[red]%}-%{$reset_color%}"
    echo "$EXIT_CODE_PROMPT"
  fi
}

RPROMPT=$(check_last_exit_code)

# Bindkeys
# Use `read` to find the keys typed
# \e = ^[

zstyle ':completion:*' menu select # Enable a graphical menu
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit


# nyae
#  n: no
#  y: yes
#  a: abort
#  e: edit

setopt CORRECT  # Correct command line
# Type ! + command line to search in the history
#
#
# > redirect stdout to a file
# >> appends text to an existing file
#

# Find escape sequences with the read commands


# https://dustri.org/b/my-zsh-configuration.html
# https://github.com/fishilico/home-files/blob/master/dotfiles/shell/zshcompletion
# https://github.com/sorin-ionescu/prezto/blob/master/modules/completion/init.zsh
alias mc='/usr/bin/mc'

# Ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
