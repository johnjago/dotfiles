set nocompatible            " just to be safe
syntax on                   " syntax highlighting

" indents and tabs

set autoindent              " set cursor at same indent level as line above
set expandtab               " use spaces instead of tabs
set tabstop=4               " width of existing tabs
set softtabstop=2           " set virtual tab stop
set shiftwidth=2            " when indenting with '>', use 2 spaces
set shiftround              " always round indents to multiple of shiftwidth
set backspace=indent,eol,start  " smart backspace
filetype plugin indent on   " load plugins and indent settings for the filetype

" editor

set number                  " line numbers
set ruler                   " cursor line and column in the status bar
set laststatus=2            " always show status bar
set wildmenu                " autocomplete menu for opening files with :e
set showmode                " show current mode
set scrolloff=5             " keep at least 5 lines above/below

" search

set incsearch               " incremental search
set hlsearch                " highlight the search
set ignorecase              " search ignoring case
set smartcase               " except when using capital letters

" key bindings

" no pressing shift for commands
noremap ; :
noremap , ;

" shortcut to turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" show buffers and prompt for number
nnoremap <leader>b :buffers<CR>:buffer<Space>

" cycle through buffers easily
set hidden
nnoremap <C-j> :bp<CR>
nnoremap <C-k> :bn<CR>

set pastetoggle=<F3>

" spelling

if v:version >= 700
  " enable spell check for markdown files
  autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en
endif

