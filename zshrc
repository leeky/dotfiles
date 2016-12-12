# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gianu"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails3 git textmate ruby lighthouse)
plugins=(gem git rbenv brew bundler k)

# Customize to your needs...
export NODE_PATH=/usr/local/lib/node_modules
export PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/local/mysql/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/X11/bin:/opt/local/bin:/usr/local/share/npm/bin
# export UNBUNDLED_COMMANDS=ruby

# Needed for Postgres command line tools
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# Include oh-my-zsh
source $ZSH/oh-my-zsh.sh

eval "$(rbenv init -)"

export PATH=$HOME/bin:$PATH

# Show contents of directory after cd-ing into it
chpwd() {
  ls -lrthG
}

# Setup environment variables
export VISUAL=vim
export EDITOR=$VISUAL

# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

# This setting is for the new UTF-8 terminal support
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source ~/.bin/tmuxinator.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export GOPATH=${HOME}/gocode
