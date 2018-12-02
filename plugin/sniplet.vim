""" DECLARATIONS {{{
" guard against multiple loaded instances
if exists('g:loaded_sniplet')
  finish
endif

" declare plugin has loaded
let g:loaded_sniplet = 1

" default trigger: <Expand>
let g:sniplet_trigger = get(g:, 'sniplet_trigger', '<Expand>')
""" END DECLARATIONS }}}

""" COMMANDS {{{
" define commands for letting the user create Sniplets
command! -nargs=+ Sniplet call sniplet#create('', <f-args>)
command! -nargs=+ ISniplet call sniplet#create('i', <f-args>)
command! -nargs=+ CSniplet call sniplet#create('c', <f-args>)
command! -nargs=+ SnipletBuffer call Sniplet <buffer> <args>
command! -nargs=+ ISnipletBuffer call ISniplet <buffer> <args>
command! -nargs=+ CSnipletBuffer call CSniplet <buffer> <args>
""" END COMMANDS }}}

""" MAPPINGS {{{
" define <Plug> mappings for Insert and Command modes
" so user can use whatever keybinds they want
inoremap <expr> <Plug>SnipletExpand g:sniplet_trigger . '<C-]>'
cnoremap <expr> <Plug>SnipletExpand g:sniplet_trigger . '<C-]>'
""" END MAPPINGS }}}

" vim:fdm=marker
