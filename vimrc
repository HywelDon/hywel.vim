" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

filetype on
filetype plugin on
filetype plugin indent on

syntax enable
syntax on

set hlsearch
set nu
set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set smartindent
set autoindent
set cursorline
set ruler
set foldmethod=indent
set nofoldenable
set foldlevel=4

colorscheme ron

autocmd InsertLeave se cul

" configured for nerdtree plugin
map <C-m> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" configured for taglist plugin
set tags=tags
set tags+=./tags
let Tlist_Compact_Format = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
nnoremap <C-l> :TlistToggle<CR>

" configured for minibufexplorer plugin
let g:miniBufExplMapCTabSwitchBufs = 1

" configured for omnicppcomplete plugin
"set completeopt=longest,menu
"set nocp
"autocmd FileType c set omnifunc=ccomplete#Complete
"if has("autocmd") && exists("+omnifunc")
"	autocmd Filetype *
"		\	if &omnifunc == "" |
"		\		setlocal omnifunc=syntaxcomplete#Complete |
"		\	endif
"endif
"let OmniCpp_NamespaceSearch = 2
"let OmniCpp_DisplayMode = 1
"let OmniCpp_MayCompleteScope = 1

" configured for youcompleteme plugin
nnoremap <C-F11> :!ctags -R --c++-kinds=+p --fields=+liaS --extras=+q ./*<CR>
set runtimepath+=/home/hywel/.vim/bundle/YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_global_ycm_extra_conf = '/home/hywel/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_complete_in_comments = 1

" configured for ale plugin
set runtimepath+=/home/hywel/.vim/bundle/ale
let g:ale_sign_column_always = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_list_vertical = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:airline#extensions#ale#enabled = 1
" ale for plugin python.vim
" Check Python files with flake8 and pylint.
"let b:ale_linters = ['flake8', 'pylint']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8', 'yapf']
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" configured for airline plugin
set runtimepath+=/home/hywel/.vim/bundle/vim-airline
set runtimepath+=/home/hywel/.vim/bundle/vim-airline-themes
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='luna'

" configured for cscope plugin
if has("cscope")
	set cst
	" set nocsverb
	" add any database in curreent directory
	" if filereadable("cscope.out")
	"	cs add cscope.out
	" add database pointed to by environment
	" elseif $CSCOPE_DB != ""
	"	cs add $CSCOPE_DB
	" endif
	set csverb
endif
