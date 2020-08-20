""""""""""""""
" Remappings "
""""""""""""""
" use space to go to command mode
nnoremap <Space> :

" add delete without copy command
nnoremap D "_d

"""""""""""
" Visuals "
"""""""""""
" set color scheme
syntax on
colorscheme torte

" display line number
set number

" wrap by line
set wrap
set linebreak

" set the color column (maximum line length visual)
set colorcolumn=52

" show partially written commands
set showcmd

" enable custom statusline
set laststatus=2
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" make linebreaks nicer
set breakindent
set breakindentopt=sbr
" I use a unicode curly array with a <backslash><space>
set showbreak=↪>\

" change cursor to line in insert mode
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

" remove delay when switching to normal mode
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast

" underline spelling mistakes
hi clear SpellBad
hi clear SpellCap
hi SpellBad cterm=underline ctermfg=red
hi SpellCap cterm=underline ctermfg=blue

"""""""""""""
" Behaviour "
"""""""""""""
" bash style autocomplete
set wildmode=longest,list 

"""""""""""""""
" Indentation "
"""""""""""""""
" handle indenting with 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" auto indent new lines
set autoindent

"""""""""""""
" Searching "
"""""""""""""
" Ignore case when searching
set ignorecase
" Be case sensitive if the search word contains uppercase
set smartcase

" Highlight search results
set hlsearch
" In search, move the cursor while typing
set incsearch
