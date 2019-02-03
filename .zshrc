# export PATH=$HOME/bin:/usr/local/bin:$PATH
PATH=$(echo $(sed 's/:/\n/g' <<< $PATH | sort | uniq) | sed -e 's/\s/':'/g')

export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"
ZSH=/usr/share/oh-my-zsh/
#ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"

plugins=( archlinux systemd )

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nano'
 else
   export EDITOR='nano'
fi

if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
  __vte_osc7
fi

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh

if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

alias reboot='systemctl reboot'
alias poweroff='systemctl poweroff'
alias cat='ccat'
alias ls='ls --color=auto'
alias lsf='ls --group-directories-first --color=auto'
alias mkdir='mkdir -p'
alias cp='cp -r --reflink=auto'
alias gz='tar -xvzf'
alias xz='tar -xJf'
alias bz='tar -xvjf'
alias bz2='tar -jxvf'
alias ping='ping -c 5'
alias open='xdg-open'
alias kill='sudo pkill'
alias locate='locate -i'
alias grep='grep --color'
alias path="tr ':' '\n' <<< "$PATH""
alias task='ps aux | grep'
alias musix='ncmpcpp --screen playlist'
alias musixv='ncmpcpp --screen visualizer'
alias dlmp3='youtube-dl --extract-audio --audio-format mp3'

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
neofetch | lolcat

autoload -U promptinit; promptinit
prompt spaceship
