nnoremap <silent> <F7>  :FloatermNew <CR>
tnoremap <silent> <F7>  <C-\><C-n>:FloatermNew<CR>
nnoremap <silent> <F8>  :FloatermPrev<CR>
tnoremap <silent> <F8>  <C-\><C-n>:FloatermPrev<CR>
nnoremap <silent> <F9>  :FloatermNext<CR>
tnoremap <silent> <F9>  <C-\><C-n>:FloatermNext<CR>
nnoremap <silent> <F12> :FloatermToggle<CR>
tnoremap <silent> <F12> <C-\><C-n>:FloatermToggle<CR>

let g:floaterm_wintype   = 'split'
let g:floaterm_height    = 0.35
let g:floaterm_position  = 'botright'
let g:floaterm_autoclose = 1
let g:floaterm_autohide  = 2
