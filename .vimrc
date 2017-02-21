set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'd11wtq/ctrlp_bdelete.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'pangloss/vim-javascript'
Plug 'maksimr/vim-jsbeautify'
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

colorscheme molokai
syntax on


" Plugin Configuration
 
" CtrlP
let g:ctrlp_cmd = 'CtrlPMixed'
" set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
" let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|~|pyc|class)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
nnoremap <leader>be :CtrlPBuffer<CR>
call ctrlp_bdelete#init()
 
" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
" let g:NERDTreeBookmarksFile='C:\Users\liy1lr\.NERDTreeBookmarks'
let g:NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeShowHidden = 1

" NERD Commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
" nnoremap <F8> :SyntasticCheck<CR>


" Flake8
" let python_highlight_all=1


" Easy motion
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-sn)


" VIM JS Beautify
nnoremap <leader>jb :call JsBeautify()<CR>
autocmd FileType javascript noremap <buffer> <leader>jb :call JsBeautify()<CR>
autocmd FileType json noremap <buffer> <leader>jb :call JsonBeautify()<CR>
autocmd FileType jsx noremap <buffer> <leader>jb :call JsxBeautify()<CR>
autocmd FileType html noremap <buffer> <leader>jb :call HtmlBeautify()<CR>
autocmd FileType css noremap <buffer> <leader>jb :call CSSBeautify()<CR>
autocmd FileType javascript vnoremap <buffer> <leader>jb :call RangeJsBeautify()<CR>
autocmd FileType json vnoremap <buffer> <leader>jb :call RangeJsonBeautify()<CR>
autocmd FileType jsx vnoremap <buffer> <leader>jb :call RangeJsxBeautify()<CR>
autocmd FileType html vnoremap <buffer> <leader>jb :call RangeHtmlBeautify()<CR>
autocmd FileType css vnoremap <buffer> <leader>jb :call RangeCSSBeautify()<CR>


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
