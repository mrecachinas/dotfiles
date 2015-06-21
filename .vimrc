" clear autocmds
autocmd!

set nocompatible  " use vim settings, not vi

syntax enable     " enable syntax highlighting

set wrap

set expandtab	  " tabs are spaces
set tabstop=4     " number of visual spaces per TAB
set shiftwidth=4  " width of reindent operations and auto indentation
set softtabstop=4 " number of spaces in tab when editing
set autoindent
autocmd FileType make setlocal noexpandtab " tabs are tabs for makefiles

set number		  " show line numbers
set showcmd		  " show command in bottom bar

set cursorline

filetype indent on " load filetype-specific indent files

set wildmenu      " visual autocomplete for command menu
set lazyredraw    " redraw only when we need to
set showmatch     " highlight matching [{()}]

set incsearch     " search as chars are entered
set hlsearch      " highlight matches

nnoremap j gj
nnoremap k gk

