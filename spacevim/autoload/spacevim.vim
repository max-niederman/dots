func! spacevim#before() abort
  set timeoutlen=500

  let g:github_dashboard = { 'username': 'max-niederman', 'password': $GITHUB_TOKEN }
  let g:gista#client#default_username = 'max-niederman'
endf

func! spacevim#after() abort
endf
