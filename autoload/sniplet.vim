function! s:abbrev(mode, buflocal, pattern, expansion) abort
  let command = 'abbreviate'
  let mod = ''
  let lhs = a:pattern . get(g:, 'sniplet_trigger', '<Expand>')
  let rhs = a:expansion

  if a:mode ==? 'i'
    let command = 'iabbrev'
  elseif a:mode ==? 'c'
    let command = 'cabbrev'
  endif
  if a:buflocal
    let mod = '<buffer>'
  endif

  execute command mod lhs rhs
endfunction

function! sniplet#create(mode, ...) abort
  let buflocal = 0
  let args = a:000

  if a:1 ==? '<buffer>'
    let buflocal = 1
    let args = a:000[1:]
  endif

  let pattern = args[0]
  let expansion = join(args[1:])

  call s:abbrev(a:mode, buflocal, pattern, expansion)
endfunction
