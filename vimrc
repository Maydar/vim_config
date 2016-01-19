colorscheme elflord
set t_Co=256


set nocompatible
"indenting

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set smarttab
set smartindent

"numbers

set number

"highlight search resuts
set hlsearch

"keyboard mappings
map <F2> <ESC>:w<C-m>   
map <F3> <ESC>:tabedit  
map <F4> <ESC>:vs 
map <F5> :TagbarToggle<CR>
map <F6> :NERDTreeToggle<CR>
map <F7> :TaskList<CR>      
map <S-LEFT> <ESC>gT
map <S-RIGHT> <ESC>gt
map <F12> <ESC>:q<C-m>


imap <F2> <ESC>:w<C-m>   
imap <F3> <ESC>:tabedit  
imap <F4> <ESC>:vs 
imap <S-TAB> <ESC>gT
imap <C-TAB> <ESC>gt
imap <F12> <ESC>:q<C-m>



set backupdir=~/.vim/.swap,.
set directory=~/.vim/.swap,.

set undofile
set undodir=~/.vim/.undo

set history=1000
set enc=utf-8


autocmd BufWritePre *.{js,pl,pm,css,html,html.ep,conf} %s/\s\+$//e

filetype off

"================================================
" Vundle settings
"=============================================
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'  " let VUndle manage Vundle, required

" Code/project navigation
Plugin 'scrooloose/nerdtree' "file navigation
Plugin 'majutsushi/tagbar'   "class/module browser

"------------------=== Other ===----------------------
Plugin 'bling/vim-airline'              " Lean & mean status/tabline for vim
Plugin 'fisadev/FixedTaskList.vim'      " Pending tasks list
Plugin 'rosenfeld/conque-term'          " Consoles as buffers
Plugin 'tpope/vim-surround'     " Parentheses, brackets, quotes, XML tags, and more

"--------------=== Snippets support ===---------------
Plugin 'garbas/vim-snipmate'        " Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'   " dependencies #1
Plugin 'tomtom/tlib_vim'        " dependencies #2
Plugin 'honza/vim-snippets'     " snippets repo

"---------------=== Languages support ===-------------
" --- Python ---
Plugin 'klen/python-mode'           " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim'       " Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'        " Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
Plugin 'alvan/vim-closetag' "html support


" --- Perl ----
Plugin 'vim-perl/vim-perl'          " Perl vim highlight






call vundle#end()                   " required
filetype on
filetype plugin on
filetype plugin indent on




"airline
let g:snippets_dir = "~/.vim/vim-snippets/snippets"
set laststatus=2
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1



"TagBar настройки
let g:tagbar_autofocus = 0 " автофокус на Tagbar при открытии


" NerdTree настройки
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$','\.o$']



"=====================================================
" Python-mode settings
"=====================================================
" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" документация
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
" проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"
" провека кода после сохранения
let g:pymode_lint_write = 1

" поддержка virtualenv
let g:pymode_virtualenv = 1

" установка breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" отключить autofold по коду
let g:pymode_folding = 0


" возможность запускать код
let g:pymode_run = 0

" отключить подсветку 80 колонки
let g:pymode_options_colorcolumn = 0


" Disable choose first function/method at autocomplete
let g:jedi#popup_select_first = 0



"=====================================================
" Languages support
"=====================================================

" --- Python ---

autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with



" --- JavaScript ---
let javascript_enable_domhtmlcss=1
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd BufNewFile,BufRead *.json setlocal ft=javascript

" --- HTML ---
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" --- template language support (SGML / XML too) ---
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd bufnewfile,bufread *.rhtml setlocal ft=eruby
autocmd BufNewFile,BufRead *.mako setlocal ft=mako
autocmd BufNewFile,BufRead *.tmpl setlocal ft=htmljinja
autocmd BufNewFile,BufRead *.py_tmpl setlocal ft=python
let html_no_rendering=1
let g:closetag_default_xml=1
let g:sparkupNextMapping='<c-l>'
autocmd FileType html,htmldjango,htmljinja,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako source ~/.vim/bundle/vim-closetag/plugin/closetag.vim

" --- CSS ---
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

inoremap <C-space> <C-x><C-o>



























