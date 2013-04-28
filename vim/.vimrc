execute pathogen#infect()

" requires Vim >= 7.3
let mapleader = ","

" Reverse character search is too useful to ignore it altogether
noremap \ ,

set nocompatible

set history=800

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display
set relativenumber      " relative line numbers
set title               " show title in console title bar
set showmatch           " Show matching brackets.
set laststatus=2        " always show status line
set ruler               " show status line with cursor position in each window
set tabstop=4           " numbers of spaces of tab character
set expandtab           " convert tabs to spaces
set shiftwidth=4        " numbers of spaces to (auto)indent
set showcmd             " display incomplete commands (Pending operator mode)
set colorcolumn=120     " highlight lines longer 120 characters
set listchars=tab:▸\    " show invisibles
set list                " toggle show invisibles during runtime with 'set list!'

" Window display and behaviour

set winheight=30        " current window is always resized to 30 lines
set winminheight=5      " all other windows are at least 5 lines

nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching

" Turn on very magic regex, i.e. everything else than a-zA-Z0-9 and '_' has a
" special meaning
noremap / /\v
set hlsearch        " highlight searches
set incsearch       " incr. search
set ignorecase      " Do case insensitive search
set smartcase       " Don't ignore case if at least one letter upper case
set gdefault        " always do global search and global replace (s///g)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Movement

" jump screen lines instead of file lines
noremap j gj
noremap k gk
noremap j gj
noremap k gk


" pro-mode ;) 
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" quicker escaping
inoremap jj <ESC>

" Despite the jj fast escape, this is sometimes helpful
" This wont work in Terminal vim, but you can use an emulator like Terminator
" that won't open help on F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Fast window switching
" Nothing decent right now, use manual Ctrl-w + hjkl

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing

set backspace=indent,eol,start              " backspace deletes all these
set fileformats=unix                        " the one and only
set undofile                                " ultrawesome persistent undo (vim >= 7.3)

filetype plugin on
filetype indent on                          " indent for known filetypes
set autoindent
set smartindent

au FocusLost * :wa                          " save on lost focus, no big deal with persistent undo

nnoremap <leader>v <C-w>v<C-w>l             " ,v opens new vsplit and switches there
nmap <leader>w :w!<CR>                      " ,w saves
nmap <leader>wq :wq<CR>                     " ,wq saves and quits
nmap <leader>q :q<CR>                       " ,q quits

" Spellchecking 
nmap <silent> <leader>s :set spell!<CR>     " toggle with ,s
set spelllang=en_gb

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Additional filetypes

au BufNewFile,BufRead *.fasta       set filetype=fasta
au BufNewFile,BufRead *.fa          set filetype=fasta
au BufNewFile,BufRead *.clustalw    set filetype=align

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color
            
" Use more than eight colors in terminal
" Many terminals will not set this variable to -256color although they support
" it
if $TERM == "xterm-256color"
    set t_Co=256
endif

" Modified version of wombat colorscheme, has portions for both 256 color
" terminals and gvim
colorscheme wombat256_mod
" Alternatives
" " 256Only: desert256 
" " 256 + GUI: sorcerer, molokai, wombat256_mod, wombat256_orig, solarized
" " GUI only: desert, cloudsmidnight

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fonts
set guifont=Envy\ Code\ R\ 11   " Terminal version font set by terminal


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rest

autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc         " reload changed vimrc
" set mouse=a " mouse support


set wildmenu                    " tab completion for cmds
set wildmode=list:longest,full          " whole list for cmds on 2nd tab


if has("syntax")
  syntax on
endif

"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
" endif

command -nargs=1 TS set tabstop=<args>

let g:neocomplcache_enable_at_startup = 1
" disable AutoComplPop.ALL
let g:acp_enableAtStartup = 0
" Use neocomplcache.ALL
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.ALL
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.ALL
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.ALL
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.ALL
let g:neocomplcache_min_syntax_length = 1
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Recommended key-mappings.ALL
" <CR>: close popup and save indent.ALL
inoremap <expr><CR>  neocomplcache#smart_close_popup()."\<CR>"
" <TAB>: completion.ALL use tab to cycle through completions
" alternatively use Ctrl-j and Ctrl-k
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-j>  pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><C-k>  pumvisible() ? "\<C-p>" : "\<C-k>"
" <C-h>, <BS>: close popup and delete backword char.ALL
inoremap <expr><C-h> neocomplcache#smart_close_popup(). "\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

""" Omnicompletion  Complete this, then merge it into git
setlocal omnifunc=syntaxcomplete#Complete   " Activate omincompletion for every supported filetypes. Trigger with <C-x><C-o>
set cot+=menuone                            " If there is only one match show the possible parameters
 " Remap omnicompletion shortcut to Ctrl+spacebar
inoremap <Nul> <C-x><C-o>