# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest > 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest > 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
#export GREP_OPTIONS='--color=auto' #deprecated
alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Edit this .bashrc file
alias ebrc='edit ~/.bashrc'


parse_git_branch() {
    if [ -f .git/HEAD ]; then
        branch=$(cat .git/HEAD | sed -n 's/ref: refs\/heads\///p')
        if [ -n "$branch" ]; then
            echo "$branch"
            return
        fi
    fi
    echo ""
}
export PS1="\[\033[38;5;217m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;216m\]\h\[$(tput sgr0)\]: \[$(tput sgr0)\]\[\033[38;5;159m\](\$(parse_git_branch))\[$(tput sgr0)\] \w\n> \[$(tput sgr0)\]"

export EDITOR=vim

HISTTIMEFORMAT="%F %T "
HISTCONTROL=ignoredups

blk='\[\033[01;30m\]'   # Black
red='\[\033[01;31m\]'   # Red
grn='\[\033[01;32m\]'   # Green
ylw='\[\033[01;33m\]'   # Yellow
blu='\[\033[01;34m\]'   # Blue
pur='\[\033[01;35m\]'   # Purple
cyn='\[\033[01;36m\]'   # Cyan
wht='\[\033[01;37m\]'   # White
clr='\[\033[00m\]'      # Reset

# Alias's for multiple directory listing commands
alias la='ls -Alh' # show hidden files
alias ls='ls -aFh --color=always' # add colors and file type extensions
alias lx='ls -lXBh' # sort by extension
alias lk='ls -lSrh' # sort by size
alias lc='ls -lcrh' # sort by change time
alias lu='ls -lurh' # sort by access time
alias lr='ls -lRh' # recursive ls
alias lt='ls -ltrh' # sort by date
alias lm='ls -alh |more' # pipe through 'more'
alias lw='ls -xAh' # wide listing format
alias ll='ls -Fls' # long listing format
alias labc='ls -lap' #alphabetical sort
alias lf="ls -l | egrep -v '^d'" # files only
alias ldir="ls -l | egrep '^d'" # directories only
alias ls='ls --color=auto'
alias sl='ls --color=auto'
alias ll='ls -la'
alias l='ls -Av1h --color=always --time-style=long-iso --group-directories-first'
alias lart='ls -lart'

# alias chmod commands
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

alias c='clear'
alias h='history'
alias tree='tree --dirsfirst -F'
alias mkdir='mkdir -p -v'
alias grep='grep --color=auto'
alias catc="grep -vE '^(#|$)'"

alias gs='git status'
alias ga='git add'

alias gap='git add -p'
alias gaa='git add --all'
alias gaf='git add --all -f'
alias gc='git commit'
alias guc='git reset --soft HEAD^'
alias gac='git add --all && git commit'
alias gco='git checkout'
alias gl='git log --oneline'
alias gb='git checkout -b'
alias gst='git stash'
alias gstp='git stash pop'
alias gd='git diff --color-words'
alias gp='git push'
alias gpo='git push origin'
alias gpl='git pull'
alias gf='git fetch'

alias apb='ansible-playbook'

alias svim='sudo vim'

alias ..='cd ..;pwd'
alias ...='cd ../..;pwd'
alias ....='cd ../../..;pwd'
alias desk='cd ~/Desktop'
alias down='cd ~/Downloads'
alias docu='cd ~/Documents'
alias pict='cd ~/Pictures'
alias wdocu="cd /mnt/c/Users/$USER/Documents"
alias wpict="cd /mnt/c/Users/$USER/Pictures"
alias wdown="cd /mnt/c/Users/$USER/Downloads"
alias wdesk="cd /mnt/c/Users/$USER/Desktop"

alias vlk="vl karlt -i ~/.ssh/id_ed25519 -a && source $HOME/.vault-vars"
alias vlr="vl katurv -i ~/.ssh/id_ed25519 -a && source $HOME/.vault-vars"

# Search running processes
alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Search files in the current folder
alias f="find . | grep "

# Show current network connections to the server
alias ipview="netstat -anpl | grep :80 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'"

# Show open ports
alias openports='netstat -nape --inet'

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Show all logs in /var/log
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

# Fix SSH permissions
alias fssh="find .ssh/ -type f -exec chmod 600 {} \;; find .ssh/ -type d -exec chmod 700 {} \;; find .ssh/ -type f -name '*.pub' -exec chmod 644 {} \;"

# Automatically do an ls after each cd
cd() {
  if [ -n "$1" ]; then
    builtin cd "$@" && ls -la --group-directories-first
  else
    builtin cd ~ && ls -la --group-directories-first
  fi
}

# Check if a port is available
portcheck() {
  if [ -z "$1" ]
  then
    echo "ERROR: specify port number."
  else
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]] ; then
      echo "ERROR: argument must be a port number."
    else
      lsof -n "-i4TCP:$1" | grep LISTEN
    fi
  fi
}

# Check all listening ports
listen() {
  netstat -an | grep LISTEN | sort
}

# first_line [file]
first_line() {
  head -n 1
}

# last_line [file]
last_line() {
  tail -n 1
}

# lines [from] [to] - for piping only
line() {
  lines "$1" "$1"
}

# line [number] - for piping only
lines() {
  head -n "$2" | tail -n "+$1"
}

# numbers - for piping only
numbers() {
  cat -n -
}

# Display largest files
function largestfiles() {
    du -h -x -s -- * | sort -r -h | head -20;
}

# Display num of files and size of contents in dir
function dirinfo() {
  if [ -z "$1" ]; then
    echo "Usage: dir_info <directory_path>"
    return 1
  fi

  dir_path="$1"

  for dir in "$dir_path"/*/
  do
    dir=${dir%*/}
    echo "Directory: $dir"
    echo "    Total number of files:  $(find "$dir" -type f | wc -l)"
    echo "    Total size of contents: $(du -h -s "$dir" | cut -f1)"
  done
}

function git_branch() {
    if [ -d .git ] ; then
        printf "%s" "($(git branch 2> /dev/null | awk '/\*/{print $2}'))";
    fi
}

# Search history
function hg() {
    history | grep "$1";
}

function git_init() {
    if [ -z "$1" ]; then
        printf "%s\n" "Please provide a directory name.";
    else
        mkdir "$1";
        builtin cd "$1";
        pwd;
        git init;
        touch readme.md .gitignore LICENSE;
        echo "# $(basename $PWD)" >> readme.md
    fi
}

# Extracts any archive(s) (if unp isn't installed)
extract () {
	for archive in $*; do
		if [ -f $archive ] ; then
			case $archive in
				*.tar.bz2)   tar xvjf $archive    ;;
				*.tar.gz)    tar xvzf $archive    ;;
				*.bz2)       bunzip2 $archive     ;;
				*.rar)       rar x $archive       ;;
				*.gz)        gunzip $archive      ;;
				*.tar)       tar xvf $archive     ;;
				*.tbz2)      tar xvjf $archive    ;;
				*.tgz)       tar xvzf $archive    ;;
				*.zip)       unzip $archive       ;;
				*.Z)         uncompress $archive  ;;
				*.7z)        7z x $archive        ;;
				*)           echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}

# Searches for text in all files in the current dir
ftext ()
{
	# -i case-insensitive
	# -I ignore binary files
	# -H causes filename to be printed
	# -r recursive search
	# -n causes line number to be printed
	# optional: -F treat search term as a literal, not a regular expression
	# optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
	grep -iIHrn --color=always "$1" . | less -r
}

# Copy file with a progress bar
cpp()
{
	set -e
	strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
	| awk '{
	count += $NF
	if (count % 10 == 0) {
		percent = count / total_size * 100
		printf "%3d%% [", percent
		for (i=0;i<=percent;i++)
			printf "="
			printf ">"
			for (i=percent;i<100;i++)
				printf " "
				printf "]\r"
			}
		}
	END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
}

# Copy and go to the directory
cpg ()
{
	if [ -d "$2" ];then
		cp $1 $2 && cd $2
	else
		cp $1 $2
	fi
}

# Move and go to the directory
mvg ()
{
	if [ -d "$2" ];then
		mv $1 $2 && cd $2
	else
		mv $1 $2
	fi
}

# Create and go to the directory
mkdirg ()
{
	mkdir -p $1
	cd $1
}

# Goes up a specified number of directories  (i.e. up 4)
up ()
{
	local d=""
	limit=$1
	for ((i=1 ; i <= limit ; i++))
		do
			d=$d/..
		done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}

# Show the current version of the operating system
ver ()
{
	local dtype
	dtype=$(distribution)

	if [ $dtype == "redhat" ]; then
		if [ -s /etc/redhat-release ]; then
			cat /etc/redhat-release && uname -a
		else
			cat /etc/issue && uname -a
		fi
	elif [ $dtype == "suse" ]; then
		cat /etc/SuSE-release
	elif [ $dtype == "debian" ]; then
		lsb_release -a
		# sudo cat /etc/issue && sudo cat /etc/issue.net && sudo cat /etc/lsb_release && sudo cat /etc/os-release # Linux Mint option 2
	elif [ $dtype == "gentoo" ]; then
		cat /etc/gentoo-release
	elif [ $dtype == "mandriva" ]; then
		cat /etc/mandriva-release
	elif [ $dtype == "slackware" ]; then
		cat /etc/slackware-version
	else
		if [ -s /etc/issue ]; then
			cat /etc/issue
		else
			echo "Error: Unknown distribution"
			exit 1
		fi
	fi
}

# Show current network information
netinfo ()
{
	interfaces="$(ip link show | awk -F: '$1>0 {print $2}' | grep -v lo)"
	ips="$(for int in ${interfaces[@]};
  		do
		    	state="$(ip link show $int | awk '{print $9}')"
		    	ip_addr="$(ip -4 add show $int | grep inet | awk '{print $2}'| awk -F/ '{print $1}')"
		    	if [ ! -z $ip_addr ]; then
			      	echo "[$int/$state]:" $ip_addr
		    	fi
	  	done
	)"
	echo $ips
}

# IP address lookup
alias whatismyip="whatsmyip"
function whatsmyip ()
{
	# Dumps a list of all IP addresses for every device
	# /sbin/ifconfig |grep -B1 "inet addr" |awk '{ if ( $1 == "inet" ) { print $2 } else if ( $2 == "Link" ) { printf "%s:" ,$1 } }' |awk -F: '{ print $1 ": " $3 }';

	# Internal IP Lookup
	echo -n "Internal IP: " ; /sbin/ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'

	# External IP Lookup
	echo -n "External IP: " ; wget http://smart-ip.net/myip -O - -q
}

function os ()
{
	if [ -f /etc/lsb-release ]; then
		os=$(lsb_release -s -d)
	elif [ -f /etc/debian_version ]; then
		os="Debian $(cat /etc/debian_version)"
	elif [ -f /etc/redhat-release ]; then
		os=`cat /etc/redhat-release`
	else
		os="$(uname -s) $(uname -r)"
	fi
	echo $os
}

alias disk_mounts="df -hT | grep -Ev 'devtmpfs|tmpfs'"

function saveit ()
{
        # Copy and save a file with current date
        DATE=`date +%d%m%y`

        for i in $*
        do
                [ -r "$i" ] || { echo Error: $i does not exist;continue ;}
                [ -r $i.$DATE ] && { echo Error: $i.$DATE exists already;continue ;}
                cp -p "$i" $i.$DATE || { echo Error: copy of "$i" failed;continue ;}
                echo `basename $0`: saved "$i" to $i.$DATE
        done
}

curlt() {
    curl_format='{
        "time_namelookup": %{time_namelookup},
        "time_connect": %{time_connect},
        "time_appconnect": %{time_appconnect},
        "time_pretransfer": %{time_pretransfer},
        "time_redirect": %{time_redirect},
        "time_starttransfer": %{time_starttransfer},
        "time_total": %{time_total}
    }\n'
    if [[ $1 == https://* ]]; then
        curl -w "$curl_format" -o /dev/null -s -k $@
    else
        curl -w "$curl_format" -o /dev/null -s $@
    fi
}

kh() {
    ssh-keygen -f "$HOME/.ssh/known_hosts" -R "$1"
}

# Keychain
if command -v keychain >/dev/null 2>&1; then
	eval $(keychain --eval --quiet ~/.ssh/* 2>/dev/null)
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Go
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

PATH="$HOME/.local/bin:$PATH"

# fnm
export PATH="$HOME/.local/share/fnm:$PATH"
if command -v fnm -h &> /dev/null; then
    eval "`fnm env`"
fi

# cargo
if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

if command -v mise --version &> /dev/null; then
    eval "$($HOME/.local/bin/mise activate bash)"
fi

grep -q "^172.21.5.213 vault.hpclocal$" /etc/hosts || sudo bash -c 'echo "172.21.5.213 vault.hpclocal" >> /etc/hosts'
