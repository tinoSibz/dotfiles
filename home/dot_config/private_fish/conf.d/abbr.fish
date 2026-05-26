# Fish abbreviations — expand in place when you press space

#--------------------------------------------------------------------#
# lsd — modern ls replacement                                        #
# https://github.com/lsd-rs/lsd                                      #
# brew install lsd                                                    #
#--------------------------------------------------------------------#
abbr --add ls   'lsd'
abbr --add tree 'lsd --tree'

#--------------------------------------------------------------------#
# bat — cat with syntax highlighting                                 #
# https://github.com/sharkdp/bat                                     #
# brew install bat                                                    #
#--------------------------------------------------------------------#
abbr --add batp 'bat --plain'

#--------------------------------------------------------------------#
# ripgrep — faster grep, respects .gitignore                         #
# https://github.com/BurntSushi/ripgrep                              #
# brew install ripgrep                                                #
#--------------------------------------------------------------------#
abbr --add grep 'rg'
abbr --add rgi  'rg --no-ignore'
abbr --add rgf  'rg --files'

#--------------------------------------------------------------------#
# Navigation                                                         #
#--------------------------------------------------------------------#
abbr --add ..   'cd ..'
abbr --add ...  'cd ../..'
abbr --add .... 'cd ../../..'
