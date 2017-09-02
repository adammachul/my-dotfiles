" TODO {{{################################################################

" LEARN VIM SCRIPT http://learnvimscriptthehardway.stevelosh.com/
" rozdzial autocommands - reindent file podczas zapisu
" operator-pending mappings i more operator-pending mappings

" }}}

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

"Plugins {{{################################################################

"============== Vundle
set nocompatible
filetype off
set shell=/bin/bash  " Vundle

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" KOLORY
Plugin 'altercation/vim-colors-solarized'
Plugin 'ajh17/Spacegray.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" SYNTAX
" Plugin 'sheerun/vim-polyglot' " syntax dla wielu jezykow
Plugin 'pangloss/vim-javascript' 
Plugin 'mxw/vim-jsx'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'elzr/vim-json'
Plugin 'gko/vim-coloresque' 

Plugin 'Raimondi/delimitMate' 

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'mbbill/undotree'
Plugin 'majutsushi/tagbar'
Plugin 'easymotion/vim-easymotion'

" Trzeba doinstalowac lintery - npm install -g linter_name
" :ALEInfo pokazuje wlaczone lintery, sa na stronie githuba
Plugin 'w0rp/ale' 

Plugin 'Valloric/YouCompleteMe' " trzeba cos doinstalowac
Plugin 'ternjs/tern_for_vim' " trzeba cos doinstalowac, dodac global config tern

" SNIPPETS
" trzeba ustawiac :set nobomb  w plikach ze snipetami
Plugin 'SirVer/ultisnips' " ultisnips musza byc w folderze ~/.vim/UltiSnips
Plugin 'honza/vim-snippets'

" The following are examples of different formats supported.
" plugin on GitHub repo " Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html " Plugin 'L9'
" Git plugin not hosted on GitHub " Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin) " Plugin 'file:///home/gmarik/path/to/plugin'
" plugin install - :PluginInstall
call vundle#end()  
filetype plugin indent on

"============== Solarized
syntax enable
set background=dark
colorscheme solarized

"============== Airline/Powerline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'

"============== youCompleteMe
let g:ycm_autoclose_preview_window_after_insertion = 1

"============== mxw/vim-jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

"============== w0rp/ale
let g:ale_open_list = 1
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%severity%]-[%linter%] says - %s'

let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {'javascript': ['eslint', 'flow'],}
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_flow_use_global = 1

let g:ale_list_window_size = 3

"============== ultisnipps
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-s>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsListSnippets="<c-q>"

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsEditSplit="vertical"


" }}}
"Custom scripts {{{################################################################

"============== Script configs 


" }}}
"Settings {{{################################################################

" encoding
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb "vim will put byte order mask at the start of unicode files

" UI
set showcmd " show command in bottom bar
set lazyredraw " redraws screen when it needs to -> faster macros

" show cursor
set cursorline
set cursorcolumn

" show line numbers
set number
set relativenumber

" disable swap files
set nobackup
set noswapfile

" search settings
set hlsearch
set ignorecase
set smartcase
set incsearch " show search matches as you type

set wildmenu
set wildmode=list:full,full " show prompts in normalmode

" lines
set nowrap " don't wrap lines
set tabstop=2 " tab length
set softtabstop=2 " number of spaces when hit tab in insert mode
set expandtab " changes tab to spaces
set showmatch " show matching parenthesis
set colorcolumn=81 " shows max line range for python
set textwidth=0 " line doesnt wrap without enter 
set wrapmargin=0 " line doesnt wrap without enter 

" indentation
set autoindent " wciecia
set copyindent " copy previous indentation on autoindent
set shiftwidth=4 " number of spaces to use for autoindenting
" set list " whitespaces highlight
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:· " whitespaces icons

" history
set history=1000 " remember more commands
set undolevels=1000 

" text copy/paste
set pastetoggle=<F2> " don't change line when you paste text
set clipboard=unnamed " use system clipboard as default copy reg

" scroll settings
set scrolloff=20 " at least n lines visible around cursor

" highlight same words under cursor
" autocmd CursorMoved * exe printf('match TabLine /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" autoindent on file save
" autocmd BufWritePre * :normal migg=G`i

" }}}
" Mappings {{{################################################################

" general
let mapleader="," " change leader key to ,
" helps when you discover you don't have permission to save a file
cnoremap w!! w !sudo tee % >/dev/null 

" Unmap the arrow keys
no <down> ddp
no <left> <Nop>
no <right> <Nop>
no <up> ddkP
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

" map cut & paste to what they bloody should be
vnoremap <C-c> "+y
vnoremap <C-x> "+x
map <C-v> "+gP

" auto center 
" nmap G Gzz
nmap n nzz
nmap N Nzz

" insert mode 
imap <C-c> <CR><Esc>O

" move by visible lines
nnoremap j gj
nnoremap k gk

" new line
nmap <CR> o<Esc>k

" change windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" search
nnoremap <silent> ,/ :nohlsearch<CR>  " clear highlighted searches with ,/

" visual mode
vmap < <gv " maintain visual mode after shifting > and <
vmap > >gv " maintain visual mode after shifting > and <

" useful
" highlight in visual mode last inserted text 
nnoremap gV `[v`] 
" jump between current-last oppened buffer
nnoremap <BS> <c-^>

" Plugin mappings
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F4> :TagbarToggle<CR>
nnoremap <F5> :UndotreeToggle<CR>
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
nnoremap <c-f> :FZF<CR>
nnoremap <c-b> :Buffers<CR>

nmap <Space> <Plug>(easymotion-overwin-f)

" }}}
" Abbreviations {{{################################################################
"
"============== Typos
" W! Q! Wq Wa wQ WQ W Q Qall   w execute mode
" https://sanctum.geek.nz/arabesque/vim-command-typos/

" }}}
