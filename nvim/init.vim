set nocompatible            " do not use vi defaults
syntax on                   " syntax highlighting

""" plugins

call plug#begin()
Plug 'shaunsingh/solarized.nvim'
call plug#end()

""" colors

colorscheme solarized

""" indents

set autoindent              " set cursor at same indent level as line above
set noexpandtab             " tabs for indentation
set tabstop=4               " width of tabs
set shiftwidth=4            " when indenting with '>', indent this far
set shiftround              " always round indents to multiple of shiftwidth
set backspace=indent,eol,start  " backspace over these unlike vi

filetype plugin indent on   " load plugins and indent settings for the filetype
autocmd FileType go setlocal noexpandtab shiftwidth=4 softtabstop=4

""" editor

set number                  " line numbers
set relativenumber          " show relative line numbers
set ruler                   " cursor line and column in the status bar
set colorcolumn=80          " show a vertical ruler
set laststatus=2            " show status bar
set wildmenu                " autocomplete filenames in command area
set showmode                " show current mode (insert, visual, etc.)
set scrolloff=5             " keep at least 5 lines above/below

""" netrw

let g:netrw_liststyle = 3   " file tree list style
let g:netrw_banner = 0      " remove banner
let g:netrw_browse_split = 4  " open in previous window
let g:netrw_altv = 1        " to the right of the directory tree
let g:netrw_winsize = 25    " 25 percent width
nnoremap <F4> :Vex<CR>

""" search

set incsearch               " incremental search
set hlsearch                " highlight the search
set ignorecase              " search ignoring case
set smartcase               " except when using capital letters
nnoremap <leader><space> :nohlsearch<CR>

""" whitespace

set listchars=tab:>~,trail:·,space:·
noremap <F8> :set list!<CR>

""" buffers

" list buffers and prompt for number to switch to
nnoremap <leader>b :buffers<CR>:buffer<Space>

" cycle through buffers quickly
set hidden
nnoremap <C-j> :bp<CR>
nnoremap <C-k> :bn<CR>

" close buffers quickly
nnoremap <leader>d :bd<CR>

""" other key bindings

" no pressing shift for commands
noremap ; :
noremap , ;

" one keystroke for common commands
nnoremap q :q<CR>
nnoremap w :w<CR>

" cycle through windows quickly
nnoremap <leader>w <C-w><C-w>

" switch for pasting text from other applications
set pastetoggle=<F3>
