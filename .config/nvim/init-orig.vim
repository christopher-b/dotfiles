""""""
" Auto Commands
augroup custom
  autocmd!

  "Strip trailing whitespace on save
  autocmd BufWritePre * :%s/\s\+$//e

  " Autosave files
  " autocmd CursorHold * update
  " autocmd InsertLeave,CursorHold * call SmartSave()
  autocmd InsertLeave * call SmartSave()

  " Toggle relativenumber option when entering and leaving insert mode:
  au InsertEnter * :set norelativenumber
  au InsertLeave * :set relativenumber

  " Cursor line only on active pane
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline

  " autocmd ColorScheme * runtime printf("after/colors/%s.vim", expand("<amatch>"))

  " Enter terminal insert mode automatically
  autocmd TermOpen * startinsert

  " autocmd VimLeave * call SaveSess()
  " autocmd VimEnter * nested call RestoreSess()
augroup END

" Smart autosave
function! SmartSave()
    if filewritable(expand('%')) == 1 || ! findfile(expand('%:t'), expand('%:h'))
        silent! w!
    endif
endfunction

" For customizing themes. Displays highlight group data
function! SynStack() abort
  for i1 in synstack(line("."), col("."))
    let i2 = synIDtrans(i1)
    let n1 = synIDattr(i1, "name")
    let n2 = synIDattr(i2, "name")
    echo n1 "->" n2
  endfor
endfunc
nnoremap ss :call SynStack()<CR>

function! SaveSess() abort
    execute 'mksession! ' . getcwd() . '/.session.vim'
endfunction

function! RestoreSess() abort
  if filereadable(getcwd() . '/.session.vim')
    execute 'so ' . getcwd() . '/.session.vim'
    if bufexists(1)
      for l in range(1, bufnr('$'))
        if bufwinnr(l) == -1
          exec 'sbuffer ' . l
        endif
      endfor
    endif
  endif
endfunction

" Indent
set expandtab
set shiftwidth=2
" set smartindent
set softtabstop=2
set tabstop=2

" Display
set laststatus=1
set noshowmode
set lcs=tab:▸\ ,trail:·
set number
set relativenumber
set signcolumn=number
set title
highlight clear SignColumn
colorscheme nord

" Behaviour
set ignorecase
set scrolloff=3
set splitbelow
set splitright

"""""""
" Basic Keymap (plugin-specific keys are in the plugin section below)
"
" let mapleader = ","
let mapleader = " "

" Save left hand travel
inoremap jk <esc> :w<CR>
" Terminal insert mode
tnoremap jk <C-\><C-n>

" Save buffer
noremap <Leader>s :w<CR>
inoremap <M-s> normal :w

" New file
nnoremap <Leader>n :enew<CR>

" Close current buffer without messing up tabs
nnoremap <Leader>w :bp\|bd #<CR>
nnoremap <Leader>W :tabclose<CR>

" Buffer/tab navigation
nnoremap <leader>t <Esc>:tabnew<CR>
nnoremap <A-w> <Esc>:bnext<CR>
nnoremap <A-q> <Esc>:bprevious<CR>
nnoremap <A-Q> <Esc>gT<CR>
nnoremap <A-W> <Esc>gt<CR>

" Quicker window movement
" nnoremap <C-M-j> <C-w>j
" nnoremap <C-M-k> <C-w>k
" nnoremap <C-M-h> <C-w>h
" nnoremap <C-M-l> <C-w>l

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Resize windows
map _ :resize -3<CR>
map + :resize +3<CR>
map - :3winc <<CR>
map = :3winc ><CR>

" Edit vim configuration
nnoremap <Leader>ve :e $MYVIMRC<CR>
" Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>

" Search escape highlight
" nnoremap <esc><esc> :noh <CR>
nnoremap mm :noh <CR>

" vnoremap > >gv
" vnoremap < <gv

" Move lines
" Move current line down up
nnoremap <A-j> ddp
" Move current line up own
nnoremap <A-k> dd2kp
" Dupliacte line up
nnoremap <A-down> yyp
" Duplicate line down
nnoremap <A-up> yykp
" Insert a line below current line
inoremap <A-CR> <ESC>o

" Quickfix list
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>

" Copy/paste
map <Leader>y "+y

" Yank current line
noremap Y ^vg_y

"""""""
" Plugin Settings

" Airline
let g:airline_theme='deus'
let g:airline_detect_paste = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#battery#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
function! AirlineInit() abort
  let g:airline_section_b = airline#section#create(['hunks', 'branch'])
  let g:airline_section_y = airline#section#create(['battery'])
 endfunction
augroup airline-custom
  autocmd!
  autocmd User AirlineAfterInit call AirlineInit()
augroup END

" ALE
let g:ale_completion_enabled = 1
let g:ale_fixers = {'ruby': ['standardrb']}
let g:ale_linters = {'ruby': ['standardrb']}
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '!'
" https://en.wikipedia.org/wiki/Xterm#/media/File:Xterm_256color_chart.svg
highlight ALEWarning ctermbg=16
"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)
nnoremap <Leader>ef :ALEFix<CR>
nnoremap <Leader>en :ALENextWrap<CR>
nnoremap <Leader>en :ALEPreviousWrap<CR>

" COC
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> K :call ShowDocumentation()<CR>
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
nnoremap gd :call CocActionAsync('jumpDefinition')<CR>
function! ShowDocumentation() abort
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunctio

" Commentary
map <M-/> gcc
imap <M-/> <C-o>gcc

" Fugitive
nnoremap <leader>g :0Git<cr>
nnoremap <leader>GP :Git push<cr>


" FZF
set rtp+=/opt/homebrew/opt/fzf
let $FZF_DEFAULT_OPTS='--bind alt-j:down,alt-k:up'

function! SmartFiles()
  if isdirectory('.git')
    GFiles
  else
    Files
  endif
endfunc

nnoremap <Leader>o :call SmartFiles()<CR>
nnoremap <M-o> :call SmartFiles()<CR>
" nnoremap <M-o> :GFiles<CR>
nnoremap <M-f> :BLines<CR>
nnoremap <Leader>f :BLines<CR>
nnoremap <Leader>F :Rg<CR>
nnoremap <M-b> :Buffers<CR>
nnoremap <M-r> :History<CR>
" noremap <silent> <Leader>b :Buffers<CR>
" nnoremap <silent> <C-f> :Files<CR>
" nnoremap <silent> <Leader>f :Rg<CR>
" nnoremap <silent> <Leader>/ :BLines<CR>
" nnoremap <silent> <Leader>' :Marks<CR>
" nnoremap <silent> <Leader>g :Commits<CR>
" nnoremap <silent> <Leader>H :Helptags<CR>
" nnoremap <silent> <Leader>hh :History<CR>
" nnoremap <silent> <Leader>h: :History:<CR>
" nnoremap <silent> <Leader>h/ :History/<CR>
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.7, 'yoffset': 1.0 } }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
  " \ 'preview-fg': ['fg', 'Normal'],
  " \ 'preview-bg': ['bg', 'Normal'],

" https://github.com/junegunn/fzf.vim/issues/185
" CTRL-A CTRL-Q to select all and build quickfix list
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" NERDTree
" nnoremap <Leader>d :NERDTreeMirror<CR>:NERDTreeFocus<CR>
" let NERDTreeQuitOnOpen=1
" augroup nerdtree-custom
"   autocmd!
"   " Start NERDTree and put the cursor back in the other window.
"   " autocmd VimEnter * NERDTree | wincmd p
"   " Exit Vim if NERDTree is the only window remaining in the only tab.
"   autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"   " Close the tab if NERDTree is the only window remaining in it.
"   autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"   " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
"   autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"     \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
"   " Open the existing NERDTree on each new tab.
"   " autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" augroup END

" nnoremap <Leader>x :NERDTreeToggle<CR>


" Netwr
" nnoremap <Leader>d :Vexplore<CR>
noremap <Leader>d :call ToggleNetrw()<CR>
let g:netrw_winsize = 20
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4

let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

" Undotree
nnoremap <Leader>u :UndotreeToggle<CR>

" Add your own mapping. For example:
" ,ff: open Netrw in the directory of the current file
" ,fp: open Netrw in the current working directory
" nnoremap <leader>ff :Lexplore %:p:h<CR>
" nnoremap <leader>fp :Lexplore<CR>
" nnoremap \\ :Lexplore<CR>

" Surround
" inoremap <Leader>' cs'"

"""""""
" Follow up

" https://github.com/tpope/vim-surround
" https://github.com/tpope/vim-rails
" https://github.com/Shougo/neosnippet.vim
" https://www.vimfromscratch.com/articles/vim-for-ruby-and-rails-in-2019
" https://gist.github.com/romainl/4b9f139d2a8694612b924322de1025ce
" https://github.com/ctrlpvim/ctrlp.vim
" https://github.com/preservim/tagbar
" https://github.com/vim-ctrlspace/vim-ctrlspace
" https://github.com/vim-ruby/vim-ruby
" https://github.com/ryanoasis/vim-devicons
" https://github.com/PhilRunninger/nerdtree-buffer-ops
" https://github.com/jiangmiao/auto-pairs
" https://learnvimscriptthehardway.stevelosh.com/
" https://learnvim.irian.to/customize/vim_runtime
" https://github.com/tpope/vim-ragtag/blob/master/doc/ragtag.txt
" https://github.com/ThePrimeagen/harpoon
" https://github.com/nvim-treesitter/nvim-treesitter-textobjects
