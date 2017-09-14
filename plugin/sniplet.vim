""" DECLARATIONS {{{
" guard against multiple loaded instances
if exists('g:loaded_sniplet')
  finish
endif

" declare plugin has loaded
let g:loaded_sniplet = 1

" define default abbreviation trigger
" default: <Expand>
let s:sniplet_trigger = get(g:, 'sniplet_trigger', '<Expand>')
""" END DECLARATIONS }}}

""" FUNCTIONS {{{
" define function for creating Sniplets
function! s:Sniplet(received_args, mode, is_buffer_local) abort
  let [l:pattern, l:expansion] = a:received_args

  call sniplet#Abbrev(s:sniplet_trigger, l:pattern, l:expansion,
    \ a:mode, a:is_buffer_local)
endfunction
""" END FUNCTIONS }}}

""" COMMANDS {{{
" define commands for letting the user create Sniplets
command! -nargs=+ Sniplet call s:Sniplet(sniplet#ReceiveArgs(<f-args>), "", 0)
command! -nargs=+ ISniplet call s:Sniplet(sniplet#ReceiveArgs(<f-args>), "i", 0)
command! -nargs=+ CSniplet call s:Sniplet(sniplet#ReceiveArgs(<f-args>), "c", 0)
command! -nargs=+ SnipletBuffer
  \ call s:Sniplet(sniplet#ReceiveArgs(<f-args>), "", 1)
command! -nargs=+ ISnipletBuffer
  \ call s:Sniplet(sniplet#ReceiveArgs(<f-args>), "i", 1)
command! -nargs=+ CSnipletBuffer
  \ call s:Sniplet(sniplet#ReceiveArgs(<f-args>), "c", 1)
""" END COMMANDS }}}

""" MAPPINGS {{{
" define <Plug> mappings for Insert and Command modes
" so user can use whatever keybinds they want
execute 'inoremap <Plug>SnipletExpand' g:sniplet_trigger . '<C-]>'
execute 'cnoremap <Plug>SnipletExpand' g:sniplet_trigger . '<C-]>'
""" END MAPPINGS }}}

" vim:fdm=marker
