" Leader
let mapleader = " "

set backspace=2   " Backspace deletes like most programs in insert mode
set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set encoding=utf-8
set nofoldenable

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Projections for Rails.vim
  let g:rails_projections = {
    \ "config/projections.json": {
    \  "command": "projections"
    \ },
    \ "spec/features/*_spec.rb": {
    \   "command": "feature",
    \   "template": "require 'rails_helper'\n\nRSpec.feature '%h' do\n\nend",
    \ },
    \ "spec/factories/*.rb": {
    \   "command":   "factory",
    \   "affinity":  "collection",
    \   "alternate": "app/models/%i.rb",
    \   "related":   "db/schema.rb#%s",
    \   "test":      "spec/models/%i_test.rb",
    \   "template":  "FactoryGirl.define do\n  factory :%i do\n  end\nend",
    \   "keywords":  "factory sequence"
    \ },
    \}

  let g:rails_gem_projects = {
    \ "active_model_serializers": {
    \   "app/serializers/*_serializer.rb": {
    \     "command": "serializer",
    \     "affinity": "model",
    \     "test": "spec/serializers/%s_spec.rb",
    \     "related": "app/models/%s.rb",
    \     "template": "class %SSerializer < ActiveModel::Serializer\nend"
    \   }
    \ }}

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" CtrlP CTags
nnoremap <leader>. :CtrlPTag<cr>

" Color scheme
set background=dark
colorscheme Tomorrow-Night-Bright
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Numbers
set number
set numberwidth=5

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
" nnoremap <Left> :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up> :echoe "Use k"<CR>
" nnoremap <Down> :echoe "Use j"<CR>

" vim-rspec mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <Leader>a :call RunAllSpecs()<CR>

" Use bundled rspec command when running specs
let g:rspec_command = 'Dispatch bundle exec rspec --no-color -f progress {spec}'

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Use :X to exit (as per :x), instead of encrypting file
cnoreabbrev X x

" " configure syntastic syntax checking to check on open as well as save
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" " Use RuboCop for syntax checking, but only if a .rubocop.yml is present
" let g:syntastic_ruby_checkers = ['mri']

" if filereadable('.rubocop.yml')
"   call add(g:syntastic_ruby_checkers, 'rubocop')
" endif

" " HAML linter
" let g:syntastic_haml_checkers = ['haml_lint']

" " JS linter
" let g:syntastic_javascript_checkers = ['jshint']


" Highlight words to avoid in tech writing
" =======================================
"
" obviously, basically, simply, of course, clearly,
" just, everyone knows, However, So, easy

" http://css-tricks.com/words-avoid-educational-writing/

highlight TechWordsToAvoid ctermbg=red ctermfg=white

function MatchTechWordsToAvoid()
  match TechWordsToAvoid /\c\<\(obviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy\)\>/
endfunction

autocmd FileType markdown call MatchTechWordsToAvoid()
autocmd BufWinEnter *.md call MatchTechWordsToAvoid()
autocmd InsertEnter *.md call MatchTechWordsToAvoid()
autocmd InsertLeave *.md call MatchTechWordsToAvoid()
autocmd BufWinLeave *.md call clearmatches()

" Simpler help
autocmd filetype help nnoremap <buffer><cr> <c-]>
autocmd filetype help nnoremap <buffer><bs> <c-T>
autocmd filetype help nnoremap <buffer>q :q<CR>

" Change cursor shape to an underscore  when in insert mode
let &t_SI = "\<Esc>]50;CursorShape=2\x7"
" Change back to a block in normal mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" Allow directory-specific .vimrc
set exrc
set secure
