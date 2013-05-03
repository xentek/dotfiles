" Configuration
set nocompatible 	  		" VIM
call pathogen#infect()			" easily install plugins to ~/.vim
syntax on		  		" Syntax Highlighting
filetype plugin indent on 		" Enable filetype-specific indenting and plugins
set background=dark	  		" Dark BG
colorscheme grb256	  		" Use IR_Black as theme
set nu			  		" Turn on line numbers
set autoindent				" auto-indent
set copyindent                          " use previous indention when autoindenting
set shiftwidth=2                        " 2 space tabs
set softtabstop=2			" 2 space tabs
set shiftround                          " use multiples of shiftwidth when indenting blocks
set wildmode=list:longest		" tab completion for file paths
set clipboard=unnamed			" Integrate with System Keyboard
set nobackup                            " no backup files
set nowritebackup                       " no backup files while editing 
set noswapfile                          " no swap files
set hid					" allow hiding of unsaved buffers
set ru					" show the 'ruler'
set vb					" visual bell
set noeb				" no bells
set expandtab                           " expand tabs to spaces
set tw=72                               " page width  
"set colorcolumn=80                     " draw a line at column 80
set modeline                            " turn on modeline support
set modelines=5                         " check 5 lines for modelines in the file
set ls=2				" turn on status line
set statusline=%f\ %m\ %r               " status line tweaks
set statusline+=Line:\ %l/%L            " show line numbers: current/total
set statusline+=\ \|\ Col:\ %v          " show column number

" Key Mappings
nnoremap - :Switch<cr>                                 " Switch.vim
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>          " Create the directory containing the file in the buffer
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR> " find merge conflict markers
cmap w!! %!sudo tee > /dev/null %                      " use sudo, if needed to write a file

" Filetypes
au BufRead,BufNewFile Lobfile set filetype=ruby                         " Lobfiles should be treated as ruby
au BufRead,BufNewFile Thorfile set filetype=ruby                        " Thorfiles should be treated as ruby
au BufRead,BufNewFile *.thor   set filetype=ruby                        " Thorfiles should be treated as ruby
au BufRead,BufNewFile Gemfile set filetype=ruby                         " Gemfiles should be treated as ruby
au BufRead,BufNewFile Guardfile set filetype=ruby                       " Guardfiles should be treated as ruby
au BufRead,BufNewFile *.ru set filetype=ruby                            " Rackup Files should be treated as ruby
au BufRead,BufNewFile *.jeco set filetype=erb                           " eco templates should be treated as ruby
au BufRead,BufNewFile *.eco set filetype=erb                            " eco templates should be treated as ruby
au BufNewFile,BufReadPost *.coffee setl invlist shiftwidth=2 expandtab  " 2 space indents for coffeescript
au BufRead,BufNewFile aliases set filetype=sh                           " aliases file should be treated as shell script

" syntastic config
let g:syntastic_ruby_exec = '~/.rbenv/shims/ruby'
