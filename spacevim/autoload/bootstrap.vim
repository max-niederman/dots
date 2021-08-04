function! bootstrap#before() abort
  set timeoutlen=500

  let g:delimitMate_expand_space = 1
  let g:delimitMate_expand_cr    = 1

  let g:vimfiler_ignore_pattern = ["^\.git$"]

  let g:github_dashboard = { 'username': 'max-niederman', 'password': $GITHUB_TOKEN }
  let g:gista#client#default_username = 'max-niederman'

  " Custom Filetypes
  au BufRead,BufNewFile *.astro		setfiletype astro
endfunction

function bootstrap#after() abort
endfunction
