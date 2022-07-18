let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" Дерево каталогов
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Автодополнение
Plug 'ycm-core/YouCompleteMe'

" Скобочки
Plug 'jiangmiao/auto-pairs'

" Быстрое перемещение
Plug 'easymotion/vim-easymotion'

" Красивая строка
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" colorschemes
Plug 'tomasr/molokai'

" wakatime
Plug 'wakatime/vim-wakatime'

" arduino
" Plug 'stevearc/vim-arduino' 

" View
Plug 'jbgutierrez/vim-better-comments'
" Plug 'lifepillar/pgsql.vim'

" Go
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Tex
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'

" Initialize plugin system
call plug#end()

" View
syntax on 
colorscheme molokai
let g:mapleader=','
set number relativenumber
set encoding=UTF-8
set colorcolumn=80

" Tab
set expandtab
set tabstop=4
set shiftwidth=4

" Search
set hlsearch
set incsearch

" YCM config
set completeopt-=preview
let g:ycm_show_diagnostics_ui = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" Airline config
let g:airline_theme='owo'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
set laststatus=2

" Window congig
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" mappings
map <C-n> :NERDTreeToggle<CR>
map <Leader> <Plug>(easymotion-prefix)
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" for bash
let $BASH_ENV = "~/.custom_aliases"

"python
let python_highlight_all = 1

"postgres
" let g:sql_type_default = 'pgsql'

" 80 break
set textwidth=80
set linebreak

" Tex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<s-tab>', '<Up>']
let g:SuperTabDefaultCompletionType = '<tab>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<C-n>"
let g:UltiSnipsJumpForwardTrigger = "<C-n>"
let g:UltiSnipsJumpBackwardTrigger = "<C-p>"

