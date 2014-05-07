" No audible bell
set vb

" No toolbar
set guioptions-=T
set guioptions-=r

" Use console dialogs
set guioptions+=c

" Local config
if filereadable($HOME . "/.gvimrc.local")
  source ~/.gvimrc.local
endif

