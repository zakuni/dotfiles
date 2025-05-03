let &t_Co=256

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.vim/dein'))

" Let dein manage dein
call dein#add('Shougo/dein.vim')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif

" Add or remove your plugins here:
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('Shougo/vimshell')

call dein#add('Shougo/ddc.vim')
call dein#add('vim-denops/denops.vim')
call dein#add('Shougo/ddu.vim')

" Install your sources
call dein#add('Shougo/ddc-around')

" Install your filters
call dein#add('Shougo/ddc-matcher_head')
call dein#add('Shougo/ddc-sorter_rank')

call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('altercation/vim-colors-solarized')
call dein#add('tpope/vim-endwise')
call dein#add('ruby-matchit')
call dein#add('digitaltoad/vim-jade')
call dein#add('slim-template/vim-slim')
call dein#add('tpope/vim-rails')
call dein#add('derekwyatt/vim-scala')
call dein#add('jpo/vim-railscasts-theme')
" vim-scripts repos
call dein#add('L9')
call dein#add('preservim/nerdtree')
call dein#add('vim-coffee-script')
call dein#add('Processing')
call dein#add('vim-stylus')

" You can specify revision/branch/tag.
"call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
call map(dein#check_clean(), { _, val -> delete(val, 'rf') })
call dein#recache_runtimepath()
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" Customize global settings
" Use around source.
" https://github.com/Shougo/ddc-around
call ddc#custom#patch_global('sources', ['around'])

" Use matcher_head and sorter_rank.
" https://github.com/Shougo/ddc-matcher_head
" https://github.com/Shougo/ddc-sorter_rank
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'matchers': ['matcher_head'],
      \   'sorters': ['sorter_rank']},
      \ })

" Change source options
call ddc#custom#patch_global('sourceOptions', {
      \ 'around': {'mark': 'A'},
      \ })
call ddc#custom#patch_global('sourceParams', {
      \ 'around': {'maxSize': 500},
      \ })

" Customize settings on a filetype
call ddc#custom#patch_filetype(['c', 'cpp'], 'sources', ['around', 'clangd'])
call ddc#custom#patch_filetype(['c', 'cpp'], 'sourceOptions', {
      \ 'clangd': {'mark': 'C'},
      \ })
call ddc#custom#patch_filetype('markdown', 'sourceParams', {
      \ 'around': {'maxSize': 100},
      \ })

" Mappings

" <TAB>: completion.
inoremap <silent><expr> <TAB>
\ pumvisible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'

" Use ddc.
call ddc#enable()

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
"noremap ; :
"noremap : ;


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

let g:molokai_original = 1

set laststatus=2
"set showtabline=2
set noshowmode
