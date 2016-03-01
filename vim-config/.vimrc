"Pedro's VIM config (tweaked everyday)

"load pathogen pliugin manager
execute pathogen#infect() 
call pathogen#helptags()
" due to some issues while loading plugins, filetype is set to off

"----had to switch to NEO Bundle just here because of nerdtree git
 " Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif
 if &compatible
   set nocompatible             
 endif
 " Required:
 set runtimepath^=~/.vim/bundle/neobundle.vim/
 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
call neobundle#end()
" Required:
filetype plugin indent on
 NeoBundleCheck
"---------------------------------------
filetype off

" set favorite color scheme
colorscheme solarized

" turns syntatic highlighting on
syntax on

" displays a powerline line status line in bottom
set laststatus=2
let g:airline_powerline_fonts = 1

"allows backspace to delete chars in inser mode
:set backspace=indent,eol,start 

"allows jedi to not freakout with splits
"let g:jedi#use_splits_not_buffers = "left"

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

function! CharCount()
"	exec !wc -m %
"endfunction
    let countchar = system("wc -m " . bufname("%"))
    let formated_count = "char count is:" . countchar
    vsplit __CharCount__
    normal! ggdG
    setlocal buftype=nofile
    call append(0, split(formated_count, '\v\n'))
endfunction

"nnoremap <C-M> :call CharCount()<CR>
nnoremap <buffer> <C-M> :call CharCount()<cr>

"Activate Chrome Inspector live support (bidirectional) for faster web coding
window.__BL_OVERRIDE_CACHE = true

filetype plugin indent on
syntax on
