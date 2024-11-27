# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

# Add nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Add MAMP
export PATH="/Applications/MAMP/Library/bin:$PATH"

# Default Python version
alias python='python3'

# Default PIP version
alias pip='/usr/local/bin/pip3'

# Set PHP version
PHP_VERSION=$(ls /Applications/MAMP/bin/php/ | sort -n | tail -1)

# export PATH=/Applications/MAMP/bin/php/${PHP_VERSION}/bin:$PATH
export PATH=/Applications/MAMP/Library/bin:/Applications/MAMP/bin/php/php7.4.2/bin:$PATH

# Add Bench
export PATH="/Users/viraj/Library/Python/3.7/bin/:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/viraj/google-cloud-sdk/path.bash.inc' ]; then . '/Users/viraj/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/viraj/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/viraj/google-cloud-sdk/completion.bash.inc'; fi

# Add git-all path for Edu Games Repo
# export PATH="/Applications/MAMP/htdocs/edu-games-plus/:$PATH"

# fylctl command line path
export FLYCTL_INSTALL="/Users/viraj/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

export BUN_INSTALL="$HOME/.bun" 
export PATH="$BUN_INSTALL/bin:$PATH" 

export DENO_INSTALL="/Users/viraj/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
source /Users/viraj/.docker/init-bash.sh || true # Added by Docker Desktop

export PATH="/Users/viraj/.local/share/solana/install/active_release/bin:$PATH"
