set nocompatible

;" NeoBundle設定ここから """
filetype off

if has('win32') || has('win64')
  let $DOTVIM = expand('~/vimfiles')
	let $BUNDLE = expand('~/vimfiles/bundle')
else
  let $DOTVIM = expand('~/.vim')
	let $BUNDLE = expand('~/.vim/bundle/')
endif

if has('vim_starting')
  set runtimepath+=$DOTVIM/bundle/neobundle.vim
	call neobundle#rc($BUNDLE)
endif

" let NeoBndle manage NeoBundle 
" required! 
NeoBundle 'Shougo/neobundle.vim'
" recommended to install
NeoBundle 'Shougo/vimproc'
" after install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'

" My Bundles here:
"
" original repos on github
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'bbommarito/vim-slim'
NeoBundle 'tpope/vim-rails'
" vim-scripts repos
NeoBundle 'AutoComplPop'
NeoBundle 'L9'
NeoBundle 'The-NERD-tree'
NeoBundle 'vim-coffee-script'
NeoBundle 'Processing'
" NeoBundle 'IndentHL'
NeoBundle 'Indent-Highlight'
NeoBundle 'Indent-Guides'
" NeoBundle 'snipMate'
" NeoBundle 'processing-snipmate'
" non github repos
"NeoBundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required! 
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleSearch(!) foo - search(or refresh cache first) for foo
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after NeoBundle command are not allowed..
""" NeoBundle設定ここまで """

set nobackup
syntax enable
set background=dark

set number
set shiftwidth=2
set tabstop=2
filetype plugin indent on

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
colorscheme zmrok

autocmd FileType * let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i'

"<TAB>で補完
" {{{ Autocompletion using the TAB key
" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion
function! InsertTabWrapper()
        let col = col('.') - 1
        if !col || getline('.')[col - 1] !~ '\k'
                return "\<TAB>"
        else
                if pumvisible()
                        return "\<C-N>"
                else
                        return "\<C-N>\<C-P>"
                end
        endif
endfunction
" Remap the tab key to select action with InsertTabWrapper
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" }}} Autocompletion using the TAB key

" rbファイル作成時にマジックコメントを追加
autocmd BufNewFile *.rb 0r ~/.vim/templates/rb.tpl

" IndentGuides設定
let g:indent_guides_color_change_percent = 5
" let g:indent_guides_guide_size = 1
" let g:indent_guides_start_level = 2

" unite.vim設定ここから
" 入力モードで開始する
let g:unite_enable_start_insert=0
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
