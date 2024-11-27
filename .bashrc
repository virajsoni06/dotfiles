[ -n "$PS1" ] && source ~/.bash_profile;
free-port() { kill "$(lsof -t -i :$1)"; }
kill-port() { kill -kill "$(lsof -t -i :$1)"; }

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.bash ] && . ~/.config/tabtab/__tabtab.bash || true

source /Users/viraj/.docker/init-bash.sh || true # Added by Docker Desktop

export PATH="$PATH:/Users/viraj/.foundry/bin"

# Lando
export PATH="/Users/viraj/.lando/bin${PATH+:$PATH}"; #landopath