 " Delete all auto commands (needed to auto source .vimrc after saving)
:autocmd!

" Map <F5> to turn spelling on (VIM 7.0+)
map <F5> :setlocal spell! spelllang=en_us<cr>

set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" Use filetype plugins, e.g. for PHP
filetype plugin on
filetype indent on

" Show nice info in ruler
set ruler
set laststatus=2

" ignore cases while searching in file
set ic

" Set standard setting for PEAR coding standards
set tabstop=4
set shiftwidth=4

" Use incremental searching
set incsearch

" Jump 5 lines when running out of the screen
set scrolljump=5

" Indicate jump out of the screen when 3 lines before end of the screen
set scrolloff=3

" Allow file inline modelines to provide settings
set modeline

" Switch paste mode off whenever insert mode is left
autocmd InsertLeave <buffer> se nopaste

" Source .vimrc after saving .vimrc
autocmd bufwritepost .vimrc source $MYVIMRC

" Show large "menu" with auto completion options
set wildmenu
set wildmode=list:longest

" Write with sudo ":w!!"
cnoremap w!! w !sudo tee % >/dev/null

let PHP_autoformatcomment = 1

" Auto expand tabs to spaces
setlocal expandtab

" Auto indent after a {
setlocal autoindent
setlocal smartindent

" Do not wrap lines automatically
setlocal nowrap

" Switch syntax highlighting on
syntax on

" Set background color dark
set background=dark

" The completion dictionary is provided by Rasmus: http://lerdorf.com/funclist.txt
setlocal dictionary-=/root/funclist.txt dictionary+=/root/funclist.txt

" Use the dictionary completion
setlocal complete-=k complete+=k

" Autocompletion using the TAB key
" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion

func! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction


" Remap the tab key to select action with InsertTabWrapper
inoremap <buffer> <tab> <c-r>=InsertTabWrapper()<cr>

"highlight ExtraWhitespace ctermbg=red guibg=red
"au ColorScheme * highlight ExtraWhitespace guibg=red
"au BufEnter * match ExtraWhitespace /\s\+$/
"au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Pathogen
call pathogen#infect()
call pathogen#helptags()

" Map <F6> to toggle ToggleBadWhitespace
map <F6> :ToggleBadWhitespace<cr>

