# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="agnoster"
#ZSH_THEME="prose"
ZSH_THEME="simple"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Autostart tmux
ZSH_TMUX_AUTOSTART="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails3 git textmate ruby lighthouse)
plugins=(tmux bundler gem git rbenv brew sublime)

# Customize to your needs...
export NODE_PATH=/usr/local/lib/node_modules
export PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/local/mysql/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/X11/bin:/opt/local/bin:/usr/local/share/npm/bin
export RUBY_GC_MALLOC_LIMIT=60000000
export RUBY_FREE_MIN=200000

source $ZSH/oh-my-zsh.sh

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH=$HOME/bin:$PATH

# Setup environment variables
export VISUAL=vim
export EDITOR=$VISUAL
