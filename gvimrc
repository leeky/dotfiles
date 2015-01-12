" No audible bell
set vb

" No toolbar
set guioptions-=T
set guioptions-=r

" Use console dialogs
set guioptions+=c
set guifont=Input\ Mono:h14
set linespace=2

" Local config
if filereadable($HOME . "/.gvimrc.local")
  source ~/.gvimrc.local
endif

