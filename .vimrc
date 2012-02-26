set nocompatible

""" Vundle設定 """
filetype off

if has('win32') || has('win64')
  let $DOTVIM = expand('~/vimfiles')
else
  let $DOTVIM = expand('~/.vim')
endif
set rtp+=$DOTVIM/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-endwise'
Bundle 'digitaltoad/vim-jade'
Bundle 'bbommarito/vim-slim'
Bundle 'tpope/vim-rails'
Bundle 'kchmck/vim-coffee-script'
Bundle 'sophacles/vim-processing'
" vim-scripts repos
Bundle 'AutoComplPop'
Bundle 'L9'
Bundle 'The-NERD-tree'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required! 
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
""" Vundle設定ここまで """

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

"for US keyboard
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

