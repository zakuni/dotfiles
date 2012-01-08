set nobackup
syntax enable
set background=dark

set number
set shiftwidth=2
call pathogen#infect()
filetype plugin indent on

"カレントディレクトリを開いているファイルのところに
au   BufEnter *   execute ":lcd " . expand("%:p:h")

imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

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

