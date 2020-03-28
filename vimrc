set tabstop=4       " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
set autoindent
set number
set smarttab
set relativenumber
set numberwidth=4
set wildmenu
set textwidth=80
set hlsearch
color evening
" dumb workaround for lack of support for C compound literals
let c_no_curly_error=1
syntax on

set mouse=a

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
nnoremap <C-N> :call ToggleLineNumbers()<CR>
inoremap kj <Esc>

function! XTermPasteBegin()
  set paste
  set pastetoggle=<Esc>[201~
  return ""
endfunction

function! ToggleLineNumbers()
  set rnu!
  set number!
endfunction

highlight Underlined ctermfg=green
highlight Normal ctermbg=black
highlight Visual ctermfg=black ctermbg=white

let maplocalleader = "\\"

" pathogen stuff
execute pathogen#infect()
" JSX highlighting on .js extensions
let g:jsx_ext_required = 0
" prepare PDF output from LaTeX
let g:Tex_DefaultTargetFormat='pdf'

nnoremap <silent> s :let @/='\<<C-R><C-W>\>'<CR>:set hlsearch<CR>
nnoremap <silent> <space> :noh<CR>
nnoremap <C-space> <*><#>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
highlight ColorColumn ctermbg=darkgray

nnoremap [t "_yat
nnoremap ]t vat<Esc>

cnoremap <C-S> source ~/.vimrc<CR>

filetype plugin indent on

nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
tnoremap <C-h> <C-w><C-h>
tnoremap <C-j> <C-w><C-j>
tnoremap <C-k> <C-w><C-k>
tnoremap <C-l> <C-w><C-l>


set formatoptions+=j
