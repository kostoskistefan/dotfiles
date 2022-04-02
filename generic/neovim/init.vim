call plug#begin('~/.config/nvim/plugged')
    Plug 'Shirk/vim-gas'
    Plug 'matze/vim-move'
    Plug 'google/vim-maktaba'
    Plug 'google/vim-codefmt'
    Plug 'romgrk/barbar.nvim'
    Plug 'tpope/vim-sensible'
    Plug 'yggdroot/indentline'
    Plug 'tpope/vim-commentary'
    Plug 'psliwka/vim-smoothie'
    Plug 'sheerun/vim-polyglot'
    Plug 'lambdalisue/fern.vim'
    Plug 'joshdick/onedark.vim'
    Plug 'voldikss/vim-floaterm'
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'
    Plug 'junegunn/vim-easy-align'
    Plug 'lambdalisue/nerdfont.vim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'antoinemadec/FixCursorHold.nvim'
    Plug 'lambdalisue/fern-renderer-nerdfont.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

let g:indentLine_char_list     = '|'
let g:cursorhold_updatetime    = 100
let g:airline_powerline_fonts  = 1
let g:onedark_hide_endofbuffer = 1

source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/fern.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/neovim.vim
