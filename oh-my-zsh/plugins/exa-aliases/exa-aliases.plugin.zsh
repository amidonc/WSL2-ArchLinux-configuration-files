#
# Project:  exa-aliases
# File:     /exa-aliases.plugin.zsh
#

# general use
alias ls='exa'                                                           # ls

# alias l='exa -lbF --git'                                               # list, size, type, git
alias l='exa -lbF'

# alias ll='exa -lbGF --git'                                             # long list
alias ll='exa -ibGF'

# alias llm='exa -lbGF --git --sort=modified'                            # long list, modified date sort
alias llm='exa -lbGF --sort=modified'                                    # long list, modified date sort

# alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
alias la='exa -lbhHigUmuSa --time-style=long-iso --color-scale'    # all list

# alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --color-scale'         # all + extended list

# speciality views
alias lS='exa -1'			                                 # one column, just names
alias lt='exa --tree --level=2'                                          # tree
