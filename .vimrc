set fenc=utf-8
set encoding=utf-8
scriptencoding utf-8
set fileformat=unix
set ambiwidth=double

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

syntax enable
colorscheme despacio

set number
packloadall
let mapleader="\<Space>"
map <Leader> <Plug>(easymotion-prefix)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0

map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
map <Leader>w <Plug>(easymotion-bd-w)
map / <Plug>(easymotion-sn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

set timeout timeoutlen=1000 ttimeoutlen=50

" relative line-number
set rnu

" move among buffers with CTRL 
" map <C-J> :bnext<CR>
" map <C-K> :bprev<CR>

" space-ls shows list and is in :buffer command commence 
" noremap <Leader>ls :<C-u>ls<CR>:buffer<Space>
set wildmenu
set wildmode=full
set completeopt=menuone
set ttyfast
set showmatch
set cursorline
set autoindent
set smartindent
set expandtab
set shiftwidth=2
" change directory to currently opened file
set autochdir
" no wrap for lines longer than window width; similar to toggle-truncate-lines
set nowrap

inoremap <c-d> <delete>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>

let g:coc_disable_startup_warning = 1

" let g:markdown_folding = 1
" https://github.com/neovim/nvim-lspconfig/issues/195
set signcolumn=yes
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_virtual_text_enabled = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1 
let g:asyncomplete_popup_delay = 200

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0


" ccls C++ Language Server setup
if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {'cache': {'directory': expand('~/.cache/ccls') }},
      \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif

" Key bindings for vim-lsp for ccls
nn <silent> <M-d> :LspDefinition<cr>
nn <silent> <M-r> :LspReferences<cr>
" autocmd Filetype c,cc,cpp,cxx,h,hpp nn <c-r> :LspRename<cr>
nn <silent> <M-a> :LspWorkspaceSymbol<cr>
nn <silent> <M-l> :LspDocumentSymbol<cr>



let g:lsp_cxx_hl_log_file = '/tmp/vim-lsp-cxx-hl.log'
let g:lsp_cxx_hl_verbose_log = 1
<

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'jackguo380/vim-lsp-cxx-highlight'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'easymotion/vim-easymotion'


Plug 'tpope/vim-fugitive'

Plug 'roman/golden-ratio'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
"
" let g:python3_host_prog = system('type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(cat $(pyenv root)/version | head -n 1)/bin/python" || echo -n $(which python)')


