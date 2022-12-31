set encoding=utf-8

let mapleader="\<Space>"
nmap r :source ~/.vim/vimrc<CR>

" change tab to spaces
set expandtab
" change tab to 4 spaces
" default is tab is 8 spaces 
set tabstop=4
set shiftwidth=4
" 絶対行番号&相対行番号
set number relativenumber
set nu rnu
" 折り返しなし 
set nowrap
" 開いているファイルのディレクトリに自動移動
set autochdir
" 検索結果のハイライト
set hlsearch
" Plug
call plug#begin()
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" auto-complete
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-goimports'
" running test
Plug 'vim-test/vim-test'
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" git on vim
Plug 'tpope/vim-fugitive'
" vim-airline: status line 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" vimagit
Plug 'jreybert/vimagit'
" to show changed lines from previous commit
Plug 'airblade/vim-gitgutter'
Plug 'roman/golden-ratio'
Plug 'sainnhe/everforest'
call plug#end()

" color scheme
colorscheme everforest
set background=dark
let g:everforest_background = 'soft'
let g:everforest_better_performance = 1
" LSP configuration copy from mattn
" https://mattn.kaoriya.net/software/vim/20191231213507.htm
if empty(globpath(&rtp, 'autoload/lsp.vim'))
  finish
endif

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gs <plug>(lsp-document-symbol-search)
  nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)
  " nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
  " nnoremap <buffer> <expr><c-b> lsp#scroll(-4) 
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  " inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
  let g:lsp_format_sync_timeout = 1000
  autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

augroup lsp_auto_formatting
    autocmd!
    autocmd BufWritePre *.py LspDocumentFormatSync
augroup END

" column display glitch fix
set signcolumn=yes
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1
let g:asyncomplete_popup_delay = 20
let g:lsp_text_edit_enabled = 1

set completeopt=menuone,noinsert

inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"

highlight link LspErrorHighlight Error
let g:goimports = 1

let test#strategy = "dispatch"
let test#go#runner = 'gotest'

" vim-test keybinds
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" fuzzy-history
nmap <silent> <Leader>h :History<CR>
nmap <silent> <Leader>b :Buffers<CR>

let g:lsp_diagnostics_echo_cursor = 1

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_powerline_fonts = 1
" vim-gutter
" stage the hunk with <Leader>hs or undo it with <Leader>hu.
nmap <buffer> <Leader>gu :GitGutterAll<CR>


" vim-fugitive
" :Git commit: commits what's being staged
" :x to close commit message window
" :Git push to push commits

