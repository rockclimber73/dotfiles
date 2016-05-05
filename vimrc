" my .vimrc file

" only vim
" set nocompatible
call plug#begin('~/.vim/plugged')

"Plug 'Shougo/vimproc.vim'
" themes
Plug 'nanotech/jellybeans.vim'
" statusline
Plug 'itchyny/lightline.vim'
" some defaults
Plug 'tpope/vim-sensible'
" manipulate surround characters
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
" commetary
Plug 'tpope/vim-commentary'
" repeat works everywhere
Plug 'tpope/vim-repeat'
" autodetect right indent
Plug 'tpope/vim-sleuth'

Plug 'tpope/vim-unimpaired'
" buffer managment
Plug 'jeetsukumaran/vim-buffergator'
Plug 'vim-scripts/bufkill.vim'
" search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'

" auto enable lazyloading for large file
Plug 'vim-scripts/LargeFile'
" enables transparent pasting
Plug 'conradirwin/vim-bracketed-paste'
" syntax checking
Plug 'scrooloose/syntastic'
" file manager
Plug 'scrooloose/nerdtree'
" git
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'

" Tabulate
Plug 'godlygeek/tabular'
" Compltion on tab
Plug 'ervandew/supertab'
"Plug 'szw/vim-tags'
" autosave
Plug '907th/vim-auto-save'
" relative numbers
Plug 'myusuf3/numbers.vim'
" easymoution magick
Plug 'easymotion/vim-easymotion'

" lexical checking
Plug 'reedes/vim-lexical'

" ruby
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'ngmy/vim-rubocop', { 'for': 'ruby' }
" coffee
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'vitaly/vim-syntastic-coffee', { 'for': 'coffee' }
" golang
Plug 'fatih/vim-go', { 'for': 'go' }
" json
Plug 'elzr/vim-json', { 'for': 'json' }
" toml
Plug 'cespare/vim-toml', { 'for': 'toml' }
" markdown
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'kannokanno/previm', { 'for': 'markdown' }
Plug 'tyru/open-browser.vim', { 'for': 'markdown' }
" apiblueprint
Plug 'kylef/apiblueprint.vim', { 'for': 'apiblueprint' }
" Erlang
Plug 'edkolev/erlang-motions.vim', { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-runtime', { 'for': 'erlang' }
Plug 'akalyaev/vim-erlang-spec', { 'for': 'erlang' }

" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'Shougo/vimproc', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
call plug#end()

syntax on
filetype on
filetype plugin on

let mapleader=","

" for 256 colors
set t_Co=258
" true color
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme jellybeans
set novisualbell

set backspace=indent,eol,start

if has('mouse')
  set mouse=
  set mousehide
endif

set shell=/bin/bash
set cursorline                        " Highlight current line
set expandtab                         " Insert spaces instead of actually tabs
set tabstop=2                         " Number of spaces each tab counts for
set softtabstop=2                     " Number of spaces for some tab operations
set shiftwidth=2                      " The space << and >> moves the lines
set shiftround
set smartindent                       " Smart auto-indent when creating a new line
set colorcolumn=80
set synmaxcol=300                     " The max number of columns to try and highlight
" only vim
"set ttyfast                           " Optimize for fast terminal connections
set lazyredraw
set encoding=utf-8                    " Set the default encodings just in case $LANG isn't set
set nowrap                            " Don't wrap lines
set number                            " Enable line numbers
set relativenumber
set nowritebackup                     " Don't create a backup when overwriting a file
set noswapfile                        " Don't write swap files
set nobackup                          " Don't keep backup files
set hidden
set nofoldenable
set scrolloff=5                       " Lines the cursor is to the edge before scrolling
set complete-=i                       " set complete=.,w,b,u,t
set completeopt=menu,preview
set wildmenu
set wildcharm=<TAB>
set wildmode=list:longest,full
set whichwrap=b,s,<,>,[,],l,h
set tags+=.git/tags
set lcs=trail:·,tab:→·,eol:↪,nbsp:×
set nojoinspaces                      " Don't add 2 spaces when using J

set clipboard+=unnamedplus

set hlsearch
set ignorecase
set smartcase

nmap <cr> :nohlsearch<cr>

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

nmap <C-\> :NERDTreeFind<CR>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" syntastic
let g:vimrubocop_config = '.rubocop.yml'
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_ruby_rubocop_exec = '~/.rbenv/shims/rubocop'

let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol='✗'
let g:syntastic_style_warning_symbol='⚠'

" numbers
nnoremap <F2> :NumbersToggle<CR>
let g:numbers_exclude = ['tagbar', 'nerdtree', 'vimshell', 'w3m']

" autosave
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1
"
let g:vim_tags_auto_generate = 1

let g:buffergator_viewport_split_policy = "B"

" easymotion
map <Leader> <Plug>(easymotion-prefix)
"
" GitGutter
nmap [h <Plug>GitGutterPrevHunk
nmap ]h <Plug>GitGutterNextHunk

" Ag for grep and ctrlp
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

" markdown
let g:markdown_fenced_languages = ['html', 'ruby', 'bash=sh']
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" vim-lexical
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd,apiblueprint call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END
let g:lexical#spelllang = ['en_us', 'ru_ru']

" Vim-Json
let g:vim_json_syntax_conceal = 0

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"✗":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ">", 'right': "<" },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }
