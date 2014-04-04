" Pathogen {
    execute pathogen#infect()
" }

" Basics {
	set nocompatible    " no vi compatibility

	syntax on		    " Syntax highlighting on
    "colorscheme wombat
" }

" General {
	set backspace=indent,eol,start  " allow backspacing over everything in insert mode

	if has('mouse')
        set mouse=a			" use mouse 
    endif

	set fileformats=unix
    set clipboard=unnamed   " share clipboard
    set ttimeoutlen=100

	set wildmenu		" turn on cmd line completion wild style
	set wildignore=*.dll,*.o,*.obj,*.bak,*.swp
    set wildmode=list:longest,full
" }

" Vim UI {
	set cursorline		" highlight current line
    
    " Search {
	    set hlsearch    " highlighting of search
        set ignorecase
        set smartcase 
    " }
   
    set autoindent 
    set wrap
	set number			" line numbers
	set showcmd			" show cmd being typed
	set showmatch		" show matching brace
    set nostartofline   " preserve column position during motion commands

    " Folding {
        set foldmethod=indent
        set foldnestmax=10
        set nofoldenable
        set foldlevel=1
    " }
" }

" Vim Behaviour {
    set autoread        " auto read externally modified files
    set nobackup        " no backup files

    set history=50      " keep 50 lines of command line history
" }

" Text Formatting/Layout {
	set expandtab       " spaces preferred to tabs
    set shiftwidth=4 
   	set tabstop=4       " 4-space tabs
    set formatoptions+=nl1
" }

" Plugins {
    set nocp
    filetype plugin on
    " OmniCppComplete {
        highlight Pmenu ctermbg=brown gui=bold
        let OmniCpp_NamespaceSearch = 1
        let OmniCpp_GlobalScopeSearch = 1
        let OmniCpp_ShowAccess = 1
        let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
        let OmniCpp_MayCompleteDot = 1 " autocomplete after .
        let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
        let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
        let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

        " Close preview window after unfocus
        autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
        autocmd InsertLeave * if pumvisible() == 0|pclose|endif
    " }
    
    " SuperTab {
        let g:SuperTabDefaultCompletionType = "context"
    " }

    " ctags {
        set tags=tags;/
        noremap <F5> :!ctags -R .<CR>
    " }
