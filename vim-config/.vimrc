"set nocompatible              " be iMproved, required
"filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'scrooloose/nerdtree'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
"call vundle#end()            " required
" filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

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

"CTRL -S to save
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
"map <C-s> :<C-u>Update<CR>
inoremap <c-s> <c-o>:Update<CR>
"this also required "stty -ixon" in my bashrc file

" Solving issue with pastemode with autoident, map Ctrl P to the paste mode
nnoremap <C-P> :set invpaste paste?<CR>
set pastetoggle=<C-P>
"set showmode

"Pythonian life:
" Comment #
vnoremap <silent> # :s#^#\##<cr>:noh<cr>
" Uncommend -#
vnoremap <silent> -# :s#^\###<cr>:noh<cr>

" Maximize the current split, then come back to structure later
nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction


filetype plugin indent on
syntax on
