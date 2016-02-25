"load pathogen pliugin manager
execute pathogen#infect() 
call pathogen#helptags()
" due to some issues while loading plugins, filetype is set to off


"--------------------------------------- had to switch to NEO Bundle just here because of nerdtree git
 " Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if &compatible
   set nocompatible               " Be iMproved
 endif

 " Required:
 set runtimepath^=~/.vim/bundle/neobundle.vim/

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck
"---------------------------------------
filetype off
" I use to have these two, but off for now [delete me later]
" syntax enable
" set background=dark

" set favorite color scheme
colorscheme solarized

" turns syntatic highlighting on
syntax on

" displays a powerline line status line in bottom
set laststatus=2
let g:airline_powerline_fonts = 1

"allows backspace to delete chars in inser mode
:set backspace=indent,eol,start 

"allos jedi to not freakout with splits
"let g:jedi#use_splits_not_buffers = "left"

" I use to have this at end, but off for now [delete me later]
" filetype plugin indent on


" For crontab files I am disabling the local edit file, crontabs must be
" edited in place (otherwise:error)
autocmd filetype crontab setlocal nobackup nowritebackup

" Added the ctrl+n as a shortcut for nerdtree file explorer
map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "c",
    \ "Untracked" : "u",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "‡",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Changed the way new splits are added (bottom for horizontal, or right for vertical)
set splitbelow
set splitright

" Added a keymap to opening a new terminal in a small split under the current
" one
map <C-B> :5sp<CR>:VimShell<CR>

" Added a keymap to know what time it is.
map <C-T> :echo 'Current time is ' . strftime('%c')<CR>

filetype plugin indent on
syntax on
