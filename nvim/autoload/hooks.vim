
function! hooks#before() abort " {{{

  " Spacevim global overrides {{{
  let g:spacevim_autocomplete_method = "neocomplcache"
  let g:spacevim_enable_statusline_bfpath = 1
  "}}}

  " Use f-v-c to edit this file {{{
  call SpaceVim#custom#SPC('nnoremap', ['f', 'v', 'c'], ':sp ~/.SpaceVim.d/autoload/init.vim', 'Custom .vim file', 1) "}}}

  " Remap c-l and c-p to toggle commenting {{{
  call SpaceVim#custom#SPC('nmap', ['c', 'L'], '<Plug>NERDCommenterComment', 'comment lines', 0)
  call SpaceVim#custom#SPC('nmap', ['c', 'l'], '<Plug>NERDCommenterInvert', 'toggle comment lines', 0)
  call SpaceVim#custom#SPC('nmap', ['c', 'c'], '<Plug>NERDCommenterInvert', 'toggle comment lines', 0)
  call SpaceVim#custom#SPC('vmap', ['c', 'c'], '<Plug>NERDCommenterInvert', 'toggle comment lines', 0)
  call SpaceVim#custom#SPC('nmap', ['c', 'P'], 'vip<Plug>NERDCommenterComment', 'comment paragraphs', 0)
  call SpaceVim#custom#SPC('nmap', ['c', 'p'], 'vip<Plug>NERDCommenterInvert', 'toggle comment paragraphs', 0, 1)
  " }}}

  " Use b-s to save a buffer {{{
  call SpaceVim#custom#SPC('nmap', ['b', 's'], ':update', 'save current buffer', 0, 1) " }}}
  set modelines=1

endfunction
" }}}

function! hooks#after() abort "{{{
  augroup comments " {{{
    au!
    au FileType * set formatoptions-=cro
  augroup END
  " }}}
endfunction

" }}}

" vim:foldmethod=marker:foldlevel=0
