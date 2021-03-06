set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'd11wtq/ctrlp_bdelete.vim'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
" Plug 'scrooloose/syntastic'
" Plug 'pangloss/vim-javascript'
" Plug 'editorconfig/editorconfig-vim'
" Plug 'posva/vim-vue'
call plug#end()

filetype on
filetype plugin on
filetype plugin indent on
scriptencoding utf-8


" Vim Settings
set number
set hls
set ai
set bsdir=buffer
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set fileformats=unix,dos
set wildmenu
set nocompatible
set nobackup
set cmdheight=1
set showmatch
set ruler
set incsearch
set showcmd
set updatetime=1000
set backspace=2
set mouse=a
set textwidth=80
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set splitbelow
set splitright
set clipboard=unnamed
set list
set listchars=tab:•\ ,trail:•,extends:»,precedes:«
set encoding=utf-8
set autoindent
set autoread
set autochdir

colorscheme gruvbox
syntax on


"" Plugin Configuration

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'

" CtrlP
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_user_command = 'find %s -type f' " MacOSX/Linux
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|target|dist)|(\.(git|hg|svn))$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
nnoremap <leader>be :CtrlPBuffer<CR>
call ctrlp_bdelete#init()    "ctrl-@ delete buffer


" NERDTree
map <leader>nt :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let g:NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeShowHidden = 1


" NERD Commenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1


" Easy motion
let g:EasyMotion_smartcase = 1
map <Leader>/ <Plug>(easymotion-sn)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion


"" Other configurations

" map to switch buf with control + hjkl
nnoremap <C-K> <C-W><C-K>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" map to resize viewport
map <S-l> 5<C-w>>
map <S-h> 5<C-w><

" map redraw
map <F5> :redraw!<CR>

" Flagging unnecessary whitespaces
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
