# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias _='sudo'
alias please='sudo'

#alias g='grep -in'

# Show history
alias history='fc -l 1'

# List direcory contents
alias lsa='ls -lah'
#alias l='ls -la'
alias ll='ls -l'
alias la='ls -lA'
alias sl=ls # often screw this up

alias afind='ack-grep -il'

# standard

alias ls='ls --color=auto --time-style="+%d/%m/%y %H:%M"'
alias c='clear'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias grepi='grep -i --color=auto'
alias grepir='grep -ir --color=auto'
alias diff='colordiff'
alias cl='tr -s " " | cut -d " " -f $1'
alias ll='ls -alh' 
alias ltr='ls -lhatr'
alias src='source'
alias db='dropbox'
alias .='source'
alias la='ls -lA'
alias l='ls -l'
alias vi='vim'
alias sim='sudo vim'
alias sus='sudo -s'
alias more='less'
alias rm='rm -v'
alias cp='cp -v'
alias mv='mv -v'
alias ..='cd ..'
alias dir='echo "\e[0;31mQUACK!\n\e[0mYou are kidding, right?"'
alias srcz='source ~/.zshrc'
alias sl='ls'
# misc

alias mdhtml='pandoc $1 -s --highlight-style tango -o $1.html'

alias pong='ping -c 3 www.google.com'
alias getxbf='tmux show-buffer | xclip -i -se p,c'
alias psu='ps axu'
alias psa='psu'
alias psw='ps waux'
alias pswg='ps waux | grep -v "grep" | grep -i $1 '
alias renet='syd restart net-auto-wired.service; syd restart net-auto-wireless.service'
alias psuc='psu|sort -nrk+3|head'
alias psum='psu|sort -nrk+4|head'
alias mntall='sudo mount -a'
alias mnt='sudo mount'
alias mntnas='sudo systemctl start media-nas.mount'
alias mntcd='sudo mount /dev/sr0 /mnt -t iso9660'
alias setwp='feh --bg-scale --no-fehbg $1'
alias hisrch='hist|grep $1'
alias hist='fc -li 1'
alias vb='vboxmanage'
#alias calc='python -ic "from __future__ import division; from math import *; from random import *"'
alias syd='sudo systemctl'
alias sydfa='syd --failed'
alias sydst='syd status'
alias sydls='syd list-units'
alias sydre='syd restart'
alias sydjou='sudo journalctl -a'
alias sydjouf='sydjou -f'
alias syddare='syd --system daemon-reload'
alias sydjoun='sydjou -n'
alias xmore='xmonad --recompile; xmonad --restart'
alias rng='ranger'
alias re='reset'
alias du.='du -sh'
alias cdu.='cdu -sidh'
alias win7='VirtualBox --startvm "win7"'
alias bxvm='VirtualBox --startvm "win7"'
alias net_work='sudo netctl start work_wired'
alias net_home='sudo netctl start home'
alias monitor='~/scripts/xrandr'
alias chromgl='chromium --ignore-gpu-blacklist'
alias flushc='sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches > /dev/null && echo -ne "\033[32mCache purged.\n\007"'
alias uzict='wget -qO- http://www.uzic.ch/accueil.php | sed -n '\''s/.*<marquee\ scrollamount\=3><b>\(.*\)<\/b>.*/\1/p'\'
alias :q='exit'
alias witch='which'
alias mu='echo "Welcome to mutt"|cowsay;sleep 1;mutt'
#tmux
alias txl='tmux list-sessions'
alias txk='tmux kill-session -t $1'
alias txn='tmux new-session'
alias txa='tmux attach-session -t $1'

# kill aliases
alias ka='killall'
alias killf='killall firefox'
alias killmpd='killall mpd && killall mpdscribble'
alias killmp='killall mplayer'

# dotfiles git alias

alias dgit='git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'

#fasd alias
#alias v='fasd $1 -e vim'
#alias o='fasd $1 -e mimeo'

# shutdown aliases
alias reboot='sudo systemctl reboot'
alias shutdown='sudo systemctl poweroff'


