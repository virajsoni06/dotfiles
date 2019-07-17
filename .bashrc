[ -n "$PS1" ] && source ~/.bash_profile;
free-port() { kill "$(lsof -t -i :$1)"; }
kill-port() { kill -kill "$(lsof -t -i :$1)"; }
