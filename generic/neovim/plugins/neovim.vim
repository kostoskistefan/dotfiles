if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
    set termguicolors
endif

if ($TERM == "xterm-256color")
    set lines=46 columns=169
endif

if !isdirectory($HOME."/.config/nvim")
    call mkdir($HOME."/.config/nvim", "", 0770)
endif
if !isdirectory($HOME."/.config/nvim/undo-dir")
    call mkdir($HOME."/.config/nvim/undo-dir", "", 0700)
endif

function! BufferDelete()
    if &modified
        echohl ErrorMsg
        echomsg "No write since last change. Not closing buffer."
        echohl NONE
    else
        let s:total_nr_buffers = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))

        if s:total_nr_buffers == 1
            bdelete
            q
        else
            bprevious
            bdelete #
            echo "Buffer deleted."
        endif
    endif
endfunction

au BufRead,BufNewFile *.asm set ft=gas
autocmd VimEnter,VimLeave * silent !tmux set status off

set number
set hidden
set mouse=a
set undofile
set autochdir
set expandtab
set tabstop=4
set noshowmode
set shiftwidth=4
set softtabstop=4
set encoding=UTF-8
filetype plugin on
colorscheme onedark
" set lines=46 columns=180
set clipboard=unnamedplus
set undodir=~/.config/nvim/undo-dir

cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev WQ wq
cnoreabbrev Wq wq

vmap <silent> <C-_> gc
nmap <silent> <C-_> gcc
vnoremap <silent> <Tab> >
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap <silent> <C-s> :w<CR>
vmap <silent> <C-s> :w<CR>
imap <silent> <C-z> <Esc>ua
imap <silent> <C-_> <Esc>gcc
nnoremap <silent> <Tab> :><CR>
nnoremap <silent> <C-s> :w<CR>
imap <silent> <C-r> <Esc><C-r>a
imap <silent> <C-s> <Esc>:w<CR>a
inoremap <silent> <C-s> <Esc>:w<CR>a
nmap <silent> <C-w> :call BufferDelete()<CR>

