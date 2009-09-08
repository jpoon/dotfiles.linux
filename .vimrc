" Basics {
	set nocompatible    " no vi compatibility

	syntax on		    " Syntax highlighting on
    colorscheme wombat
" }

" General {
	set backspace=indent,eol,start  " allow backspacing over everything in insert mode

	if has('mouse')
        set mouse=a			" use mouse 
    endif

	set fileformats=unix

	set wildmenu		" turn on cmd line completion wild style
	set wildignore=*.dll,*.o,*.obj,*.bak,*.swp
    set wildmode=list:longest,full
" }

" Vim UI {
	set cursorline		" highlight current line
    
    " Search {
	    set hlsearch    " highlighting of search
        set ignorecase  " ignore case
        set smartcase 
    " }
    
    set nowrap
	set number			" line numbers
	set showcmd			" show cmd being typed
	set showmatch		" show matching brace
" }

" Vim Behaviour {
    set autoread        " auto read externally modified files
    set nobackup        " no backup files

    set history=50      " keep 50 lines of command line history
" }

" Text Formatting/Layout {
	set expandtab       " spaces preferred to tabs
   
   	set tabstop=4       " 4-space tabs
" }
