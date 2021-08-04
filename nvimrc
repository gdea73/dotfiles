highlight Normal ctermbg=0

"basics"
set nocompatible
set backspace=2
set ruler
set hlsearch
set noincsearch
set tabstop=4
set shiftwidth=4
set expandtab
set title
syntax on
filetype plugin indent on
inoremap kj <Esc>

"windows"
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"terminals"
if has('nvim')
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l
    " distinguish this from the inoremap to ease vimception scenarios
    tnoremap KJ <C-\><C-n> 
    " paste the current search term and return to terminal mode
    tnoremap <C-g><C-g> grep "<C-\><C-n>"/pa" . -nIR
    nnoremap <C-t> <C-\><C-n>:sp<CR><C-\><C-n>:term<CR>i
    tnoremap <C-t> <C-\><C-n>:sp<CR><C-\><C-n>:term<CR>i
    " no numbers in a terminal window
    autocmd TermOpen * setlocal nonumber norelativenumber
    autocmd BufWinEnter,WinEnter term://* startinsert
endif

"colors"
function! ConfigureColors()
    if g:colors_name == 'evening'
        highlight Normal ctermbg=None
        highlight Visual ctermbg=60
        highlight StatusLine cterm=bold ctermbg=60
        highlight StatusLineNC cterm=bold ctermbg=236
        highlight Folded ctermbg=black
    endif
    if g:colors_name == 'morning'
        highlight DiffText ctermfg=white " make numbers in DiffText legible
        highlight Normal ctermbg=253
    endif
endfunction
augroup Coloring
	autocmd!
	autocmd ColorScheme * call ConfigureColors()
augroup END

"word highlighting"
" Ctrl+Space makes the currently selected word the search item
nnoremap <silent> <C-space> :let @/="\\<<C-R><C-W>\\>"<CR>:set hlsearch<CR>
nnoremap <silent> s :let @/="\\<<C-R><C-W>\\>"<CR>:set hlsearch<CR>
" Ctrl+Shift+Space makes the currently selected word the search item (with partial words accepted)
nnoremap <silent> <C-S-space> :let @/="<C-R><C-W>"<CR>:set hlsearch<CR>
" Shift+Space clears search
nnoremap <silent> <S-space> :let @/=""<CR>:set hlsearch<CR>
" double-click highlighting
nmap <silent> <2-LeftMouse> s
" clear highlighting; also unfold?
nnoremap <silent> <space> :noh<CR>:silent! normal zO<CR>

"numbers"
set number
set relativenumber

"meta"
autocmd BufWritePost ~/.vimrc nested source ~/.vimrc " allows nested autocommands
command! -nargs=0 Erc edit ~/.vimrc

"mouse"
set mouse=a

"miscellaneous"
" remove extra comment prefix when joining comment lines with J
set formatoptions+=j
" locally change directory to parent of current file
" totally assumes that the file you're editing has an extension
nnoremap <leader>cd :lcd <C-r>%<C-w><C-w><C-w><CR>
" refresh syntax highlighting
map <F5> :syntax sync fromstart<CR>
" for copying out of terminal buffers
nnoremap <silent> gn :let @" = substitute(@", '\n', '', 'g')<CR>
" copy default register to system clipboard
nnoremap <silent> gc :let @+=@"<CR>

" TODO: create & source BC-specific nvimrc for this MACHINE_ID highlighting
"autocommands"
autocmd BufNewFile,BufRead *.h\|*.hpp call HighlightMachineIDs()

"syntax highlighting"
function! HighlightMachineIDs()
    hi machineid ctermbg=yellow ctermfg=black
    " why the heck doesn't this work? syntax match machineid /\<MACHINE_ID\>/
    syntax match machineid /\<MACHINE_ID\>/ containedin=ALL
endfunction

"OR something into selection buffer -- note, actually activated with <C-/>
nnoremap <C-_> /<C-r>/\\|
