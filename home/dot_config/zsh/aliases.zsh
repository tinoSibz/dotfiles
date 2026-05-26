#--------------------------------------------------------------------#
# aliases.zsh                                                        #
# Sourced by .zshrc                                                  #
# Philosophy: aliases for tools you use daily. Keep it lean.        #
# Shell compatibility: zsh only. Fish and Nushell manage their own. #
#--------------------------------------------------------------------#

#--------------------------------------------------------------------#
# lsd — modern ls replacement                                        #
# https://github.com/lsd-rs/lsd                                      #
# brew install lsd                                                    #
#--------------------------------------------------------------------#
alias ls='lsd'
alias tree='lsd --tree'

#--------------------------------------------------------------------#
# bat — cat with syntax highlighting                                 #
# https://github.com/sharkdp/bat                                     #
# brew install bat                                                    #
#--------------------------------------------------------------------#
alias cat='bat'
alias catp='bat --plain'  # no decorations, useful for piping

#--------------------------------------------------------------------#
# ripgrep — faster grep, respects .gitignore                         #
# https://github.com/BurntSushi/ripgrep                              #
# brew install ripgrep                                                #
#--------------------------------------------------------------------#
alias grep='rg'
alias rgi='rg --no-ignore'   # search everything including .gitignore
alias rgf='rg --files'       # list files that would be searched

#--------------------------------------------------------------------#
# Navigation                                                         #
#--------------------------------------------------------------------#
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

#--------------------------------------------------------------------#
# Safety                                                             #
#--------------------------------------------------------------------#
alias rm='rm -i'   # confirm before deleting
alias mv='mv -i'   # confirm before overwriting
alias cp='cp -i'   # confirm before overwriting
