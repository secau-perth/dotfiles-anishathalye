function ip-addr() {
    curl -4 -s ifconfig.me/ip |perl -pe chomp
}

function cpdir() {
  pwd | tr -d "\r\n" | clip.exe
}

function now() {
  date +"%d-%b-%Y-%H%M"
}

function now.short() {
  date +"%d-%b-%Y"
}

function tkill() {
  local pid="$1"
  kill -9 $(pgrep -f "$pid")
}

function ipv6disable() {
	for i in $(ls /proc/sys/net/ipv6/conf);do
		sysctl -w net/ipv6/conf/$i/disable_ipv6=1
	done
}

function ipv6check() {
	for i in $(ls /proc/sys/net/ipv6/conf);do
		sysctl net/ipv6/conf/$i/disable_ipv6
	done
}

function ipv6enable() {
	for i in $(ls /proc/sys/net/ipv6/conf);do
		sysctl -w net/ipv6/conf/$i/disable_ipv6=0
	done
}

function rgg() {
	rg --no-{filename,heading,line-number} --color never "$@"
}

function path_remove() {
    PATH=$(echo -n "$PATH" | awk -v RS=: -v ORS=: "\$0 != \"$1\"" | sed 's/:$//')
}

function path_append() {
    path_remove "$1"
    PATH="${PATH:+"$PATH:"}$1"
}

function path_prepend() {
    path_remove "$1"
    PATH="$1${PATH:+":$PATH"}"
}

function here() {
    local loc
    if [ "$#" -eq 1 ]; then
        loc=$(realpath "$1")
    else
        loc=$(realpath ".")
    fi
    ln -sfn "${loc}" "$HOME/.shell.here"
    echo "here -> $(readlink $HOME/.shell.here)"
}

there="$HOME/.shell.here"

function there() {
    cd "$(readlink "${there}")"
}