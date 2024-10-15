# luka aliases.bash
# by rxxuzi

alias ls='ls --color=auto'
alias ip='ip --color=auto'
alias ll=' ls --human-readable --size -1 -S --classify -la --color=auto'
alias la='ls -A'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias 'cd..'='cd ..'
alias '..'='cd ..'
alias '...'='cd ../../../'
alias '....'='cd ../../../../'
alias '.....'='cd ../../../../'
alias '.4'='cd ../../../../'
alias '.5'='cd ../../../../..'
alias sha256='openssl sha256'
alias whatsup='service --status-all'  
alias mkdir='mkdir -pv'
alias cls='clear'
alias hg='history | grep $1'  
alias untar='tar -zxvf $1'
alias ports='netstat -tulanp'
alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'
alias usage='du -ch | grep total'
alias totalusage='df -hl --total | grep total'
alias ports='netstat -tulanp'
alias myip='curl ifconfig.me'
alias serve='python3 -m http.server'
alias mkcd='mkdir -p "$1" && cd "$1"'
alias reload='source ~/.bashrc'
alias py='python3'
alias fastc='f() { output="${1%.c}"; gcc "$1" -o "$output.bin" && ./"$output.bin"; }; f'
alias '?'='f() { ls -l "$1" && file "$1"; }; f'
