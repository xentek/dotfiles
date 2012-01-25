" Configuration
set nocompatible 	  		" VIM
syntax on		  		" Syntax Highlighting
filetype plugin indent on 		" Enable filetype-specific indenting and plugins
set background=dark	  		" Dark BG
colorscheme grb256	  		" Use IR_Black as theme
set nu			  		" Turn on line numbers
set autoindent				" auto-indent
call pathogen#infect()			" easily install plugins to ~/.vim
set softtabstop=2			" 2 space tabs
set wildmode=list:longest		" tab completion for file paths
set clipboard=unnamed			" Integrate with System Keyboard
set nobackup				" Don't create *.swp files
set hid					" allow hiding of unsaved buffers
set ru					" show the 'ruler'
set vb					" visual bell
set noeb				" no bells
set ls=2				" status bar
set expandtab                           " expand tabs to spaces
set tw=72                               " 72 character width

" Key Mappings
map <leader>t :FuzzyFinderTextMate<CR>	" CMD+T support for FuzzyFinder
nmap <F8> :TagbarToggle<CR>             " Tagbar Hot Key

" Filetypes
au BufRead,BufNewFile Thorfile set filetype=ruby                        " Thorfiles should be treated as ruby
au BufNewFile,BufReadPost *.coffee setl invlist shiftwidth=2 expandtab  " 2 space indents for coffeescript
