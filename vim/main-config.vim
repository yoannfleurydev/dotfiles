" enable the syntax highlight
syntax enable

set autoread                   " reload files when changed on disk
set background=dark            " for the status bar to print correctly on gnome
set backspace=indent,eol,start " make backspace work like most other apps
set colorcolumn=81             " limit line-length to 80 characters
set encoding=utf-8             " set the encoding
set incsearch                  " search as you type
set laststatus=2               " for the status bar to appear all the time
set list                       " enable invisibles
set listchars=space:·,tab:▸\ ,trail:▫,extends:>,precedes:<,nbsp:+,eol:¬
set noshowmode                 " Hide the default mode text
set number                     " line numbers
set ruler                      " show were you are
set scrolloff=3                " show context above/below cursorline
set smartcase                  " case-sensitive searc hif any caps
set softtabstop=4 shiftwidth=4 expandtab
set ttyfast                    " send more characters for redraws
set wildignore+=*.class

" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo


