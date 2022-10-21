call plug#begin('~/.config/nvim/plugged')
    Plug 'romgrk/barbar.nvim'
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-commentary'
    Plug 'joshdick/onedark.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
    Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
    Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
call plug#end()

" COQ ==================================================================================================== 

" Enable COQ completion
augroup COQ 
	autocmd!
	autocmd VimEnter * COQnow -s
augroup END

" CHADTree ==================================================================================================== 

" CHADTree config
let g:chadtree_settings = { "view.width": 30, "view.sort_by": ["is_folder", "file_name", "ext"] }

" Close vim if CHADTree is the last window
autocmd BufEnter * if (winnr("$") == 1 && &filetype == "CHADTree") | q | endif 

" Open CHADTree with Ctrl+E
noremap <C-e> <cmd>CHADopen<cr>

" Automatically open CHADTree when Vim loads
augroup CHADTreeAutoEnter 
    autocmd!
    autocmd FileType c,cpp,make,cmake,html,css,java,javascript,python,sh,bash CHADopen --nofocus
augroup END

" ToggleTerm ==================================================================================================== 

" Setup ToggleTerm
augroup SetupToggleTerm 
	autocmd!
    autocmd VimEnter * lua require("toggleterm").setup{}
augroup END

" ToggleTerm key mapping
noremap <silent> <F12> <cmd>ToggleTerm<CR>
tnoremap <silent> <F12> <cmd>ToggleTerm<CR>

" Lightline ==================================================================================================== 

" Set lightline theme
let g:lightline = { 'colorscheme': 'wombat', 'enable': {'statusline': 1, 'tabline': 0} }

" NeoVim ==================================================================================================== 

" Enable 256 colors
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

" Syntax Highlighting
syntax on

" Show line numbers
set number

" Use UTF-8 encoding (for vim devicons)
set encoding=UTF-8

" Set tab to 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Convert tabs to spaces
set expandtab

" Set working directory to the current file
set autochdir

" Use an undo file to preserve history between sessions
set undofile
set undodir=~/.config/nvim/undo-dir

" Hide Vim modes, since we are using lightline
set noshowmode

" Filetype detection and associated plugins
filetype plugin on

" Use system clipboard
set clipboard=unnamedplus

" Set hybrid line numbers
set number relativenumber

" Abbreviations for my sloppy typing
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev WQ wq
cnoreabbrev Wq wq

" Function to close the current buffer 
" if there are more than 1 buffers in the list,
" otherwise exit vim
function! BufferCloseHandler()
    if (len(getbufinfo({'buflisted':1})) == 1)
        exit
    else 
        BufferClose
    endif
endfunction

" Key mappings
nmap <silent> <C-_> gcc
vmap <silent> <C-_> gc
imap <silent> <C-_> <Esc><S-v>gc<Esc>i
noremap <silent> <C-s> <cmd>w<CR>
inoremap <silent> <C-s> <Esc>:w<CR>a
inoremap <silent> <C-z> <Esc>ua
noremap <silent> <C-w> :call BufferCloseHandler()<CR>

" Set Vim colorscheme
colorscheme onedark
