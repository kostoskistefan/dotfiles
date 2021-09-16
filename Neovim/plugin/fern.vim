map <silent> <C-e> :Fern <C-r>=<SID>smart_path()<CR> -drawer -toggle<CR>

let g:fern#renderer = "nerdfont"

function! s:init_fern() abort
  setlocal nonumber norelativenumber
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> h <Plug>(fern-action-hidden-toggle)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

function! s:smart_path() abort
  if !empty(&buftype) || bufname('%') =~# '^[^:]\+://'
    return fnamemodify('.', ':p')
  endif
  return fnamemodify(expand('%'), ':p:h')
endfunction
