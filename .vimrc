" Kyle Hovey's Vim Dotfile
" Disable weird spacing with emoji's
:set noemoji

" ================ SYSTEM ================
" THE BASICS
" Make sure terminal is 256 colors
set t_Co=256
" Set the system clipboard
set clipboard=unnamedplus,unnamed,autoselect
" Enable Mouse Support
set mouse=a
" Disable bell
set belloff=all

" =========== PLUGIN MANAGER =============
" VUNDLE SETUP
" Be iMproved, Required
set nocompatible
" Required
filetype off
" Set the Runtime Path to Include Vundle and Initialize
set rtp+=~/.vim/bundle/Vundle.vim

" VUNDLE PLUGINS
" Begin Plugin Definition
call vundle#begin()

" Vundle Plugin Manager
Plugin 'VundleVim/Vundle.vim'
" NERD Tree File Browser
Plugin 'scrooloose/nerdtree'
" FZF Fuzzy Finder Support
Plugin 'junegunn/fzf'
" Syntax Checking
Plugin 'scrooloose/syntastic'
" Surround
Plugin 'tpope/vim-surround'
" Repeat with .
Plugin 'tpope/vim-repeat'
" Git Integration
Plugin 'tpope/vim-fugitive'
" Rails Support
Plugin 'tpope/vim-rails'
" Auto Complete
Plugin 'Valloric/YouCompleteMe'
" Language Support
Plugin 'sheerun/vim-polyglot'
" Git Diff
Plugin 'airblade/vim-gitgutter'
" Smooth Scrolling
" Plugin 'yuttie/comfortable-motion.vim'
" Vim LaTeX
Plugin 'vim-latex/vim-latex'
" LaTeX Preview
Plugin 'xuhdev/vim-latex-live-preview'
" Indentation Highlighting
Plugin 'Yggdroot/indentLine'
" Color Highlighting
Plugin 'lilydjwg/colorizer'
" NerdTree Git Integration
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Vim PanDoc
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
" Delete buffers and keep windows intact
Plugin 'qpkorr/vim-bufkill'
" Searcher that is silver
Plugin 'mileszs/ack.vim'
" Commenting
Plugin 'tomtom/tcomment_vim'
" Nice Status Bar
Plugin 'vim-airline/vim-airline'
" Git Blame
Plugin 'zivyangll/git-blame.vim'

" End Plugin Definition
call vundle#end()
filetype plugin indent on
set autoindent

" =========== SYNTAX HIGHLIGHTING =============
" THE BASICS
" Enable It
syntax on

" COLOR SCHEME
colorscheme srcery
" Dark Background
set background=dark

" SYNTAX FILES
" Handlebars Template Syntax
au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars

" ============== STATUS SECTIONS =================
" Never Display Status Line
" set laststatus=0
" Show the Tab Line When We Need It
set showtabline=1
" Hide the Default Mode Text
" set noshowmode

" =============== VIEW SETTINGS ===============
" THE BASICS
" Enable Line Numbering
set nu
" Wrap text
set lbr
" Use a Visual Bell
set visualbell

" FOOTER AREA
" Minimize Command Window Height
set cmdheight=1
" Display Cursor Position
set ruler

" =============== EDITOR OPTIONS ===============
" FOLDING
" Fold Based Upon Indent
set foldmethod=indent
" Deepest Fold Allowed Is 10 Levels
set foldnestmax=10
" Don't Fold by Default
set nofoldenable
" Allow Folding At One Line
set foldlevel=1

" Indentation
" Sane tabstop
set tabstop=2
set shiftwidth=2
" Indentation marker character
let g:indentLine_char = '|'
" Enable indent lines by default
let g:indentLine_enabled = 1
" Use spaces instead of tabs
set expandtab

" DELETING
" Make Backspace Act Normal
set backspace=2

" SPLITTING
" Open splits intutiively
set splitbelow
set splitright

" HIGHLIGHTING
" Highlight All Search Results
set hlsearch
" Transparent background
hi Normal guibg=NONE ctermbg=NONE

" SYNTAX CHECKING [Syntastic]
" My Compiler
let g:syntastic_cpp_compiler = 'clang++'
" Use C++ 14
let g:syntastic_cpp_compiler_options = ' -std=c++1z'

" AUTO COMPLETE
" Silence Autocomplete Warnings
let g:ycm_global_ycm_extra_conf = '~/.config/ycm/ycm_extra_conf.py'
" Disable Preview Window
set completeopt-=preview

" LaTeX
" Set Preview As the Default LaTeX Viewer
let g:livepreview_previewer = 'open -a Preview'
" Don't convert symbols
let g:tex_conceal = ""
" And please don't add text I didn't type...
let g:Imap_FreezeImap=1
" Send errors to black hole
let g:Tex_ViewRule_pdf='evince 2>/dev/null'
" Stop the linter and warnings
let g:Tex_IgnoreLevel = 8

" GIT [GitGutter]
" Enabled by Default
let g:gitgutter_enabled = 1
" Update time for checking Git
set updatetime=250

" JS
" Enable JSDoc syntax
let g:javascript_plugin_jsdoc = 1

" ACK/AG
" Use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" =============== EDITOR MACROS ===============
" SETUP
" SPACE LEADER
let mapleader="\<Space>"
" Use Semicolon for Command Mode
" nnoremap ; :
" Navigate up and down through wrapped lines naturally
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Timeout for key codes

" FILE I/O
" Save
nnoremap ; :w<CR>
" Save As
map <Leader>W :w<Space>
" Quit Vim
map <Leader>Q :q<CR>

" SPELL CHECKING
map <Leader>w z=1<CR>

" SESSIONS
" Create new session
map <Leader>sc :mks ~/.vim/sessions/.vim<Left><Left><Left><Left>
" Save session
map <Leader>ss :mks!<CR>
" Load session
map <Leader>sl :source ~/.vim/sessions/

" FILE SHORTCUTS
" Edit .vimrc
map <Leader>ev :e ~/.vimrc<CR>
" Edit Todo
map <Leader>eT :e ~/Dropbox/Todo/todo.vim<CR>

" TAB MANAGEMENT
" Open a New Tab
map <Leader>t :tabe<CR>

" SPLIT CREATION
" Enable splitting in each direction
nnoremap <Leader>sh :sp<CR>
nnoremap <Leader>sv :vsp<CR>

" SPLIT MANAGEMENT
" Navigate Up
nnoremap <Leader>k <C-w>k
" Navigate Down
nnoremap <Leader>j <C-w>j
" Navigate Left
nnoremap <Leader>h <C-w>h
" Navigate Right
nnoremap <Leader>l <C-w>l
" Equalize Splits
nnoremap <Leader>= <C-w>=
" Minimize Split
nnoremap <Leader>- :vertical resize 0<CR>

" BUFFER MANAGEMENT
" Navigate to Next Buffer
nnoremap <Leader>H :bprev<CR>
" Navigate to Previous Buffer
nnoremap <Leader>L :bnext<CR>
" Reload Buffer
map <Leader>e :edit<CR>
" Delete Buffer
map <Leader>q :BD<CR>

" NERD TREE
" Go to NERD Tree
map <Leader>f :NERDTreeToggle<CR><C-l>

" FZF
" Run through ag first to ignore everything in .gitignore
let $FZF_DEFAULT_COMMAND='ag --nocolor --ignore node_modules -g ""'
" Open FZF
map <Leader>F :FZF<CR><C-l>

" ACK
map <Leader>a :Ack!<Space>""<Left>

" GIT
" Show/Hide GitGutter
map <Leader>gg :GitGutterToggle<CR>
" Stage Current File
map <Leader>ga :Gwrite<CR>
" Commit Changes
map <Leader>gc :Gcommit -v<CR>
" Push Changes
" map <Leader>gp :!git push origin master<CR>

" COMPILING/RUNNING
" Compile Pandoc
map <Leader>P :!pandoc --from markdown+fancy_lists *.md --variable urlcolor=cyan -o out.pdf<CR>
" Run In Python 3
map <Leader>p :w !python<CR>
" Run In Node
map <Leader>N :w !node<CR>
" Run In Ruby
map <Leader>bb :w !ruby<CR>
" Set Up Cmake in CWD
map <Leader>C :! cp -r ~/.cmake/* ./; cmake .<CR>
" Compile C++
map <Leader>c :make<CR>
" Compile Rust
map <Leader>ru :!rustc ./*.rs -o run<CR>
" Run Rust
map <Leader>rr :!./run<CR>
" Run Compiled C++
map <Leader>R :!./run<CR>
" Generate cout from comment
map <Leader>o 0/\/<CR>velcstd::cout << "<esc>$a\n";<esc>:nohl<CR><C-l>
" Turn cout into comment
map <Leader>O 0/std<CR>v5ec// <esc>$v3hx:nohl<CR><C-l>
" Grep for TODO statements
map <Leader>T :vimgrep "TODO" ./* -r<CR>

" SEARCHING/HIGHLIGHTING
" Clear Highlights and Redraw
map <Leader>d :nohl<CR><C-l>

" VIEW CHANGING
" Toggle indent lines
map <Leader>i :IndentLinesToggle<CR>

" LaTeX
map <Leader>lp :LLPStartPreview<CR>

" Config
map <Leader>r :so ~/.vimrc<CR>

" ============= CRYPTOGRAPHY SETUP =============
" MAIN CRYPTO
" Use Strong-Ish Algorithm
:setlocal cm=blowfish
