leeky's dotfiles
================

Based on dotfiles from thoughtbot, r00k and others.

Requirements
------------

Set zsh as your login shell.

    chsh -s /bin/zsh

Currently assumes oh-my-zsh is installed in ~/.oh-my-zsh/

Install
-------

Clone onto your laptop:

    git clone git://github.com/leeky/dotfiles.git


Install [rcm](https://github.com/thoughtbot/rcm):

    brew bundle

Install:

    rcup -d dotfiles -x README.md -x LICENSE -x Brewfile

This will create symlinks for config files in your home directory. The
`-x` options, which exclude the `README.md` and `LICENSE` files, are
needed during installation but can be skipped once the `.rcrc`
configuration file is symlinked in.

You can safely run `rcup` multiple times to update:

    rcup

Make your own customizations
----------------------------

Put your customizations in dotfiles appended with `.local`:

* `~/.aliases.local`
* `~/.gitconfig.local`
* `~/.gvimrc.local`
* `~/.tmux.conf.local`
* `~/.vimrc.local`
* `~/.vimrc.bundles.local`
* `~/.zshrc.local`


