autocmd!

syntax enable
set background=dark
colorscheme solarized

set fileformats=unix,dos,mac
set viminfo=

set cmdheight=1
set showcmd
set number
set ruler
set noerrorbells
set visualbell t_vb=
set lazyredraw
set scrolloff=5
set wrap
set list
set listchars=tab:>·,trail:·
set report=0
set shortmess=atI
set wildmenu
set wildmode=list:longest
if has('syntax')
  syntax on
  if &term == 'rxvt-unicode'
    set t_Co=256
  endif
  if &t_Co == 256
    colorscheme solarized
  else
    colorscheme solarized
  endif
endif

filetype on
filetype plugin on
syntax enable

set cursorline
"hi CursorLine term=none cterm=none ctermbg=1

"------ Indents and tabs ------"
set autoindent                  " set the cursor at same indent as line above
set smartindent                 " try to be smart about indenting (C-style)
set expandtab                   " expand <Tab>s with spaces; death to tabs!
set shiftwidth=4                " spaces for each step of (auto)indent
set softtabstop=4               " set virtual tab stop (compat for 8-wide tabs)
set tabstop=8                   " for proper display of files with tabs
set shiftround                  " always round indents to multiple of shiftwidth
set copyindent                  " use existing indents for new indents
set preserveindent              " save as much indent structure as possible
filetype plugin indent on       " load filetype plugins and indent settings

set spl=en spell
set nospell
