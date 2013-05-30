set nocompatible

""" NeoBundle設定ここから """
filetype off

if has('win32') || has('win64')
  let $DOTVIM = expand('~/vimfiles')
	let $BUNDLE = expand('~/vimfiles/bundle')
else
  let $DOTVIM = expand('~/.vim')
	let $BUNDLE = expand('~/.vim/bundle/')
endif

if has('vim_starting')
  set runtimepath+=$DOTVIM/bundle/neobundle.vim/
endif

call neobundle#rc($BUNDLE)

" let NeoBndle manage NeoBundle 
NeoBundle 'Shougo/neobundle.vim'

" recommended to install
NeoBundle 'Shougo/vimproc'
" after install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile

NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplcache-snippets-complete'

" My Bundles here:
"
" original repos on github
NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'tpope/vim-endwise'
NeoBundle 'ruby-matchit'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'bbommarito/vim-slim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'Lokaltog/powerline'
" vim-scripts repos
"NeoBundle 'AutoComplPop'
NeoBundle 'L9'
NeoBundle 'The-NERD-tree'
NeoBundle 'vim-coffee-script'
NeoBundle 'Processing'
NeoBundle 'vim-stylus'
" NeoBundle 'IndentHL'
NeoBundle 'Indent-Highlight'
NeoBundle 'Indent-Guides'
" NeoBundle 'snipMate'
" NeoBundle 'processing-snipmate'
"NeoBundle 'quickrun'
" non github repos
"NeoBundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required! 

" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

""" NeoBundle設定ここまで """

""" neocomplecache設定ここから """
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1


" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

set nobackup
set noswapfile
syntax enable
set background=dark

set expandtab
set number
set shiftwidth=2
set tabstop=8
set cursorline

""" NERDTree 設定 """

" ファイルを指定せずにVimを起動したらNERDTreeを開く
"autocmd vimenter * if !argc() | NERDTree | endif

" 開いているのがNERDTreeだけになったらvimを閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

""" NERDTree 設定ここまで """


"カレントディレクトリを開いているファイルのところに
au   BufEnter *   execute ":lcd " . expand("%:p:h")

"imap { {}<LEFT>
"imap [ []<LEFT>
"imap ( ()<LEFT>

"検索結果のハイライトをESC連打で消す
set hlsearch
noremap <Esc><Esc> :nohlsearch<CR><Esc>

"for US Keyboard
"コロンセミコロン入れ変え
noremap ; :
noremap : ;


" solarized options
"let g:solarized_termcolors=256
"colorscheme solarized

colorscheme railscasts
"colorscheme blue 
"colorscheme default 
"colorscheme delek 
"colorscheme darkblue 
"colorscheme desert 
"colorscheme elflord 
"colorscheme evening 
"colorscheme koehler 
"colorscheme morning 
"colorscheme murphy "なかなか良い
"colorscheme pablo 
"colorscheme peachpuff 
"colorscheme ron 
"colorscheme shine 
"colorscheme slate "これも良いかも
"colorscheme torte
"colorscheme zellner 
"colorscheme 256-jungle
"colorscheme af
"colorscheme anotherdark 
"colorscheme asu1dark
"colorscheme bensday
"colorscheme billw
"colorscheme Black
"colorscheme BlackSea
"colorscheme Dark2
"colorscheme darkspectrum
"colorscheme impact
"colorscheme rcg_gui
"colorscheme thestars
"colorscheme twilight
"colorscheme zmrok


"autocmd FileType * let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i'

"<TAB>で補完
" {{{ Autocompletion using the TAB key
" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion
"function! InsertTabWrapper()
"        let col = col('.') - 1
"        if !col || getline('.')[col - 1] !~ '\k'
"                return "\<TAB>"
"        else
"                if pumvisible()
"                        return "\<C-N>"
"                else
"                        return "\<C-N>\<C-P>"
"                end
"        endif
"endfunction
" Remap the tab key to select action with InsertTabWrapper
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" }}} Autocompletion using the TAB key

" rbファイル作成時にマジックコメントを追加
autocmd BufNewFile *.rb 0r ~/.vim/templates/rb.tpl

" IndentGuides設定
let g:indent_guides_color_change_percent = 5
" let g:indent_guides_guide_size = 1
" let g:indent_guides_start_level = 2

" unite.vim設定ここから
" 入力モードで開始する
let g:unite_enable_start_insert=1
" 縦分割で開く
" let g:unite_enable_split_vertically = 1
let g:unite_winwidth = 80
let g:unite_winheight = 15 
" バッファ一覧
noremap <C-U><C-B> :Unite buffer<CR>
" ファイル一覧
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
" 最近使ったファイルの一覧
noremap <C-U><C-R> :Unite file_mru<CR>
" レジスタ一覧
noremap <C-U><C-Y> :Unite -buffer-name=register register<CR>
" ファイルとバッファ
noremap <C-U><C-U> :Unite buffer file_mru<CR>
" 全部
noremap <C-U><C-A> :UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


let g:molokai_original = 1

" let g:Powerline_symbols = 'fancy'
set laststatus=2
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
