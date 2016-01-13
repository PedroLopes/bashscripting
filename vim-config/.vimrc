"load pathogen pliugin manager
execute pathogen#infect() "
" due to some issues while loading plugins, filetype is set to off
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

" I use to have this at end, but off for now [delete me later]
" filetype plugin indent on
