" My vimrc
" Author:	    Steve Lee <me@xiangyangli.com>
" Last change:	2017-11-05


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't try to be vi compatible
set nocompatible

" Show what you are typing as a command.
set showcmd

" number of lines
set number

" Hide GUI widget and color
if has("gui_running")
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set t_Co=256
    set guitablabel=%M\ %t
    set guifont=Inconsolata\ 12
    set guicursor+=a:blinkon0 "disable cursor bliking
    autocmd GUIEnter * set vb t_vb= "disable bell
endif

" Make backspace behave in a sane manner
set backspace=indent,eol,start

" syntax on
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin using Vbundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
" Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'maralla/completor.vim'
Plugin 'stevecn/tslime.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'jiangmiao/auto-pairs'
Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'lvht/phpcd.vim'

" Colorscheme
Plugin 'chriskempson/base16-vim'
call vundle#end()            " required

" Enable file type detection and do language-dependent indenting
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => End Plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set encoding to utf8
set encoding=utf8

" Use spaces instead of tabs;
" and Be smart when using tabs.
set expandtab
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Huge History
set history=1000

" Searching
set ignorecase  " Ignore case when searching
set smartcase   " smart about case when searching
set hlsearch    " Highlight search results
set showmatch   " Show matching brackets when text indicator is over them
set cursorline  " highlight current line

set colorcolumn=81

" mouse and hide the cursor
set mouse=a
set mousehide

" Always show the status line
if has('statusline')
    set laststatus=2
    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General key maping
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Leader key
let mapleader = ';'

inoremap jj <Esc>
cmap suw w !sudo tee > /dev/null %

" Trim tail write space
noremap <leader>w :call TrimWhitespace()<CR>
noremap <leader>s :w<CR>
autocmd BufWritePre * :call TrimWhitespace()

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin config and key maping
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp.vim

" NERDTree
map <C-e> :NERDTreeToggle<CR>
" NERDCommenter

" Colorscheme
map <leader>ccl :colorscheme base16-tomorrow<CR>
map <leader>ccn :colorscheme base16-atelier-seaside<CR>
" colorscheme base16-google-dark
" colorscheme base16-default-dark
" colorscheme base16-github
colorscheme base16-tomorrow-night

" Tagbar
nnoremap <leader>tt :TagbarToggle<CR>
nnoremap <leader>tj :TagbarOpen j<CR>

" tslime
let g:tslime_normal_mapping = '<leader>t'
let g:tslime_visual_mapping = '<leader>t'
let g:tslime_vars_mapping = '<leader>T'

" completor
let g:completor_php_omni_trigger = '([\w-]+|::[\w-]*|[\w-]+->\s*[\w-]*)$'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Function
""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun
