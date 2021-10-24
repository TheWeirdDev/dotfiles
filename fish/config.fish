export PAGER="less"

set -xU LESS_TERMCAP_mb (tput bold; tput setaf 2) # green
set -xU LESS_TERMCAP_md (tput bold; tput setaf 6) # cyan
set -xU LESS_TERMCAP_me (tput sgr0)
set -xU LESS_TERMCAP_so (tput bold; tput setaf 3; tput setab 4) # yellow on blue
set -xU LESS_TERMCAP_se (tput rmso; tput sgr0)
set -xU LESS_TERMCAP_us (tput smul; tput bold; tput setaf 7) # white
set -xU LESS_TERMCAP_ue (tput rmul; tput sgr0)
set -xU LESS_TERMCAP_mr (tput rev)
set -xU LESS_TERMCAP_mh (tput dim)
set -xU LESS_TERMCAP_ZN (tput ssubm)
set -xU LESS_TERMCAP_ZV (tput rsubm)
set -xU LESS_TERMCAP_ZO (tput ssupm)
set -xU LESS_TERMCAP_ZW (tput rsupm)
set -xU GROFF_NO_SGR 1

export LESSOPEN="| /usr/bin/highlight %s --out-format xterm256 --force --line-numbers --style molokai"
#set -xU LESS_TERMCAP_md (printf "\e[01;31m")
#set -xU LESS_TERMCAP_me (printf "\e[0m")
#set -xU LESS_TERMCAP_se (printf "\e[0m")
#set -xU LESS_TERMCAP_so (printf "\e[01;44;33m")
#set -xU LESS_TERMCAP_ue (printf "\e[0m")
#set -xU LESS_TERMCAP_us (printf "\e[01;32m")In 
#set -xU LESS "--RAW-CONTROL-CHARS"

set -g theme_display_user yes
#set -g theme_color_scheme gruvbox 
set -g theme_show_exit_status yes

# . /etc/profile.d/cnf_fish.sh

#set SPACEFISH_PROMPT_ORDER time user dir host git package node docker ruby golang php rust haskell julia aws conda pyenv kubecontext exec_time line_sep battery jobs exit_code char

set SPACEFISH_NODE_SHOW false
set SPACEFISH_PHP_SHOW false
set SPACEFISH_PROMPT_ADD_NEWLINE false
set SPACEFISH_PROMPT_SEPARATE_LINE false
set SPACEFISH_PROMPT_FIRST_PREFIX_SHOW true
set SPACEFISH_PROMPT_PREFIXES_SHOW false
set SPACEFISH_TIME_SHOW true
set SPACEFISH_USER_SHOW always
set SPACEFISH_DIR_TRUNC 2
set SPACEFISH_EXIT_CODE_SHOW true
set SPACEFISH_TIME_COLOR white
set SPACEFISH_USER_COLOR green
set SPACEFISH_PYENV_SHOW true

set -Ux LS_COLORS "di=36:ln=30;42:so=34;46:pi=33:ex=1;32:bd=30;47:cd=30;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
#alias ls="ls --color=auto"
#source /etc/grc.fish

set -U fish_color_command 319f47
set -U fish_color_error ff3333

eval (thefuck --alias | tr '\n' ';')
alias pr='ps aux | grep '
alias load-headset='pactl load-module module-bluetooth-discover'
alias wifi='sudo arp-scan --interface=(ifconfig | head -1 | sed "s/:.*//") --localnet'
alias inst='sudo pacman -S'
alias wine32='env WINEPREFIX=~/.wine32 WINEARCH=win32 wine'
alias remv='sudo pacman -Rnsc'
alias updt='sudo pacman -Syu'
alias report='history | sort | cut -f1 -d" " | sort | uniq -c | sort -n | uniq -u | tail -100'
alias gres="dbus-send --type=method_call --print-reply --dest=org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Eval string:'global.reexec_self()'"
alias A='yay -Ss'
alias S='yay -S'
alias cl='git clone --depth=1'
alias s='ls'

alias pkgs "pacman -Qq | pacman -Qi - | egrep '(Size\s+:|Name\s+:[^s])' | sed -E 's/ ([KMG])iB/\1/' | sed -z 's/\nInstalled/ /g' | perl -pe 's/(Name|Size) *: //g' | column -t | sort -hk2 -r | cat -n | tac"
alias pkgs2 "LC_ALL=C pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h"
alias pkgupsizes "expac -S -H M '%k\t%n' (pacman -Qqu) | sort -sh"
alias pkgnew "expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort | tail -n 20"
alias pkgbrows "expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort | tail -n 20"

set PATH $PATH /home/alireza/go/bin /home/alireza/.gem/ruby/2.5.0/bin /home/alireza/bin /home/alireza/.deno/bin (npm bin)

function mcd
    mkdir $argv; cd $argv
end

alias :q="exit"
alias :wq="exit"
alias :q!="exit"
alias :qa="exit"
alias ...="cd ../.."
alias ....="cd ../../.."
alias cp="cp -i"
alias ping="grc ping -c 5"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias myip2="dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | cut -d'\"' -f2"
alias bat="env PAGER='' bat"
alias py "python"
alias bpy "bpython"
alias gst-launch="gst-launch-1.0"
alias yt="youtube-dl -f 22 -i"
alias ydl="youtube-dl"
alias wg-li-down 'sudo wg-quick down ~/vypr-li1.conf'
alias wg-li-up 'python ~/vypr.py li && sudo wg-quick up ~/vypr-li1.conf'
alias fzf "fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"

alias urldecode='python3 -c "import sys, urllib.parse as ul; print(ul.unquote_plus(sys.argv[1]))"'
alias urlencode='python3 -c "import sys, urllib.parse as ul; print (ul.quote_plus(sys.argv[1]))"'

alias ips "ip -br -c addr show"
alias ports "ss -tulpn"

function transfer --description 'Upload a file to transfer.sh'
    if [ $argv[1] ]
        # write to output to tmpfile because of progress bar
        set -l tmpfile ( mktemp -t transferXXX )
        curl --progress-bar --upload-file $argv[1] https://transfer.sh/(basename $argv[1]) >> $tmpfile
        cat $tmpfile
        command rm -f $tmpfile
    else
        echo 'usage: transfer FILE_TO_TRANSFER'
    end
end

alias lxc-run "sudo lxc-start -n playtime && sudo lxc-attach -n playtime"
alias lxc-restart "sudo lxc-stop -n playtime && sudo lxc-start -n playtime"

alias icat "kitty +kitten icat --align=left"

function pkgbins
    pacman -Ql $argv[1] | sed -n -e 's/.*\/bin\///p' | tail -n +2
end
function pkgfiles
    pacman -Qlq $argv[1] | grep -v '/$' | xargs -r du -h | sort -h
end
export LS_COLORS=(vivid generate snazzy)
#starship init fish | source

export GO111MODULE=on
