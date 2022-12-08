set encoding=utf-8

let mapleader="\<Space>"
nmap r :source ~/.vim/vimrc<CR>

" change tab to spaces
set expandtab
" change tab to 4 spaces
" default is tab is 8 spaces 
set tabstop=4
set shiftwidth=4
" 相対行番号
set rnu
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
" vim-gutter for show diff/changes
Plug 'airblade/vim-gitgutter'

Plug 'sainnhe/everforest'
call plug#end()

" color scheme
colorscheme everforest
set background = dark
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
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  " inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

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
