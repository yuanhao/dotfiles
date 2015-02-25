set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'kien/ctrlp.vim'
Plugin 'Shougo/vimproc'
Plugin 'Shougo/vimshell'
Plugin 'Shougo/neocomplcache'
Plugin 'myusuf3/numbers.vim'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
" Swift?
" Plugin 'fatih/vim-go'
" Plugin 'klen/python-mode'
" Plugin 'pangloss/vim-javascript'
Plugin 'L9'

call vundle#end()

filetype on
filetype plugin on
filetype plugin indent on

" Vim Settings
" let g:impact_transbg=1
set number
set hls
set ai
set bsdir=buffer
set tabstop=4
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

colorscheme molokai
syntax on

" Plugin Configuration

" Airline
let g:airline_theme = "serene"

" vim-javascript
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Nerdcommenter
let g:NERDSpaceDelims = 1

" Nerdtree
map <Leader>nt :NERDTreeToggle<CR>

" Tagbar
nmap <Leader>tt :TagbarToggle<CR>

" easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-sn)
let g:EasyMotion_smartcase = 1
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" CtrlP
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" VimShell
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '
let g:vimshell_editor_command = '/Applications/MacVim.app/Contents/MacOS/Vim'
let g:vimshell_max_command_history = 10000
nnoremap <silent> S :<C-u>VimShellBufferDir -popup<CR>

" Numbers
let g:numbers_exclude = ['tagbar', 'bufexplorer', 'vimshell', 'nerdtree']

" Neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define file-type dependent dictionaries.
" let g:neocomplcache_dictionary_filetype_lists = {
"     \ 'default' : '',
"     \ 'vimshell' : $HOME.'/.vimshell_hist',
"     \ 'scheme' : $HOME.'/.gosh_completions'
"     \ }

" Define keyword, for minor languages
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion. Not required if they are already set elsewhere in
" .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion, which require computational power and may stall
" the vim.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" Key Mappings
" Map function
" nnoremap <silent> <F4> :BufExplorer<CR>
" nnoremap <silent> <F5> :Tlist<CR>
" nmap <silent> <F6> :NERDTreeToggle<CR>
"
" map to switch buf with control + hjkl
nnoremap <C-K> <C-W><C-K>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" map to resize viewport
map <S-l> 5<C-w>>
map <S-h> 5<C-w><
"map <S-j> 3<C-w>+
"map <S-k> 3<C-w>-

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>