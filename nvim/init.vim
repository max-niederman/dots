""" Plugins

" Specify plugin directory
call plug#begin(stdpath('data') . '/plugged')

" Language
Plug 'sheerun/vim-polyglot' " Language integration pack
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Completions engine
Plug 'liuchengxu/vista.vim' " LSP symbol viewer
Plug 'lervag/vimtex' " LaTeX suport
Plug 'scrooloose/syntastic' " Syntax checking
Plug 'sbdchd/neoformat' "Syntax formatting

" Functionalities
Plug 'tpope/vim-repeat' " Enable repeating plugin maps with '.'
Plug 'lambdalisue/suda.vim' " Read/Write files with sudo
Plug 'tpope/vim-fugitive' " Git commands
Plug 'airblade/vim-gitgutter' " Show git diff line-by-line
Plug 'preservim/nerdtree' " Graphical file explorer
Plug 'Xuyuanp/nerdtree-git-plugin' " NERDTree Git integration
Plug 'ryanoasis/vim-devicons' " File/folder icons in NERDTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " NERDTree color highlights
Plug 'editorconfig/editorconfig-vim' " Respect editorconfig settings
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy find files
Plug 'kassio/neoterm' " Integrated terminal wrapper
Plug 'vim-test/vim-test' " Test runner
Plug 'scrooloose/nerdcommenter' " Easy commenting
Plug 'easymotion/vim-easymotion' " Easier repeated motions
Plug 'jiangmiao/auto-pairs' " Automatically insert bracket pairs
Plug 'machakann/vim-sandwich' " Surround selections with characters

" Integrations
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } " Firefox neovim client
Plug 'wakatime/vim-wakatime' " WakaTime integration

" Aesthetic
Plug 'vim-airline/vim-airline' " Lightweight status/tabline
Plug 'junegunn/goyo.vim' " Distraction-free editing mode
Plug 'junegunn/limelight.vim' " Hyperfocus-writing mode
Plug 'dylanaraps/wal.vim' " Use wal colors

" Initialize plugins
call plug#end()

""" Vim Configurations
filetype plugin indent on
set secure exrc
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd showmode
set cmdheight=2
set wrap breakindent
set encoding=UTF-8
set number relativenumber
set mouse=nv
set title

colorscheme wal

" GUI Configurations
set guifont=FiraCode\ Nerd\ Font:h14
let g:neovide_refresh_rate=144
let g:neovide_cursor_trail_length=0.5
let g:neovide_cursor_vfx_mode = 'pixiedust'

" Language Providers
let g:python_host_prog = '~/.asdf/shims/python2'
let g:python3_host_prog = '~/.asdf/shims/python3'

""" Plugin Configurations & Bindings

" CoC
let g:coc_global_extensions = [
            \ 'coc-yank',
            \ 'coc-snippets',
            \ 'coc-highlight',
            \ 'coc-git',
            \ 'coc-pyright',
            \ 'coc-rls',
            \ 'coc-clangd',
            \ 'coc-java',
            \ 'coc-tsserver',
            \ 'coc-eslint',
            \ 'coc-html',
            \ 'coc-svelte',
            \ 'coc-css',
            \ 'coc-json',
            \ 'coc-yaml',
            \ 'coc-docker',
            \ 'coc-vimtex',
            \ 'coc-discord-rpc'
            \ ]

nmap <silent> <leader>a :CocAction<CR>

" Vista
let g:vista_default_executive = 'coc'

nmap <silent> <C-l> :Vista!!<CR>

" Vimtex
let g:vimtex_view_automatic = 1
let g:vimtex_view_general_viewer = 'zathura'

function! s:CloseTexViewers()
    if executable('xdotool') && exists('b:vimtex')
                \ && exists('b:vimtex.viewer') && b:vimtex.viewer.xwin_id > 0
        call system('xdotool windowclose '. b:vimtex.viewer.xwin_id)
    endif
endfunction

au BufUnload *.tex VimtexClean
au User VimtexEventQuit call s:CloseTexViewers()

" Neoformat
let g:neoformat_try_formatprg = 1
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_only_msg_on_error = 1

augroup neoformat
    au!
    "au BufWritePre *.{js,ts,jsx,tsx} Neoformat
    "au BufWritePre *.{html,svelte} Neoformat
    "au BufWritePre *.{css,scss,sass,less} Neoformat
augroup END

" NERDTree
let NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['^.git$', '^.vscode$', '^__pycache__$']

nmap <silent> <C-k> :NERDTreeToggle<CR>
nmap <silent> <leader>r :NERDTreeRefresh<CR>

" FZF
nmap <silent> <leader>f :FZF<CR>

" Vim-test
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

" Firenvim
let g:firenvim_config = {
            \ 'globalSettings': {},
                \ 'localSettings': {
                    \ '.*': {
                        \ 'takeover': 'never',
                    \ },
                \ },
            \ }

" Goyo
nmap <silent> <leader>g :Goyo<CR>

augroup FocusedEditing
    au!
    au User GoyoEnter Limelight
    au User GoyoLeave Limelight!
    au User GoyoEnter,GoyoLeave SyntasticToggleMode
augroup END

""" Filetype-Specific Configurations

" HTML, XML, Jinja, Svelte
au FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType svelte setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType htmldjango inoremap {{ {{  }}<left><left><left>
au FileType htmldjango inoremap {% {%  %}<left><left><left>
au FileType htmldjango inoremap {# {#  #}<left><left><left>

" Markdown and Journal
au FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

" JavaScript and TypeScript
au FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType javascriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType typescriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Firebase Rules
au BufCreate *.rules setlocal shiftwidth=2 tabstop=2 softtabstop=2

""" Mappings, Autocommands, and Functions

" Clipboard
vmap <C-c> "+y
vmap <C-v> "+p

" Use tab to trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>CheckBackSpace() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:CheckBackSpace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <C-Space> to trigger completion
inoremap <silent><expr> <C-Space> coc#refresh()
" Use <CR> to confirm completion
inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Word swapping
function! s:MirrorDict(dict)
    for [key, value] in items(a:dict)
        let a:dict[value] = key
    endfor
    return a:dict
endfunction

function! SwapWords(dict, ...)
    let words = keys(a:dict) + values(a:dict)
    let words = map(words, 'escape(v:val, "|")')
    if(a:0 == 1)
        let delimiter = a:1
    else
        let delimiter = '/'
    endif
    let pattern = '\v(' . join(words, '|') . ')'
    exe '%s' . delimiter . pattern . delimiter
        \ . '\=' . string(s:MirrorDict(a:dict)) . '[submatch(0)]'
        \ . delimiter . 'g'
endfunction

" Code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

""" Session Initialization

function! s:InitSession()
    " Open the terminal window
    new
    wincmd J
    resize 15
    Topen
    T clear

    " Open NERDTree
    NERDTree

    " Focus the primary window if a file was provided
    if argc()
        wincmd l
    endif
endfunction

" Get a list of parent processes
let s:parent_proc = split(system(join(['pstree -sA ',  getpid()])), '---')

if count(s:parent_proc, 'neovide') > 0
    " Neovide
    " Most GUI-specific options are set in ginit.vim

    " Running immediately after VimEnter prevents the terminal window from being resized for some reason
    au VimEnter * call s:InitSession()
elseif count(s:parent_proc, 'firefox') > 0
    " Firenvim
else 
    " All other parents, i.e. terminal emulators
    au VimEnter * call s:InitSession()
endif
