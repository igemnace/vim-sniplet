" creates a Sniplet by executing an appropriate abbrev
function! sniplet#Abbrev(trigger, pattern, expansion, mode, is_buffer_local)
  " use mode argument to determine whether to use iabbrev or cabbrev
  if a:mode ==? "i"
    let l:abbrev_command = "iabbrev"
  elseif a:mode ==? "c"
    let l:abbrev_command = "cabbrev"
  else
    " define a default, modeless abbrev command
    let l:abbrev_command = "abbreviate"
  endif

  " use is_buffer_local argument to determine whether to add <buffer>
  if a:is_buffer_local
    let l:modifier = "<buffer>"
  else
    " define a default, empty modifier for abbrev
    let l:modifier = ""
  endif

  " append the trigger to the pattern
  " to form the left-hand side of the abbrev command
  let l:lhs = a:pattern . a:trigger

  " execute the abbrev
  execute l:abbrev_command l:modifier l:lhs a:expansion
endfunction

" receives <f-args> from a user-facing command as a list
" and extracts the pattern and the expansion for the Sniplet
function! sniplet#ReceiveArgs(...)
  " first word will always be the pattern
  let l:pattern = a:000[0]

  " second word onwards will be the expansion
  let l:expansion = join(a:000[1:])

  return [l:pattern, l:expansion]
endfunction
