set background=dark
"colorscheme anotherdark
colorscheme solarized
"colorscheme desert

"起動時フルスクリーン
if has("gui_running")
  set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen
endif

" ツールバーを削除
set guioptions-=T

"メニューを削除
set guioptions-=m

set nobackup
set transparency=15
set imdisable
set guifont=Osaka-Mono:h16

let g:save_window_file = expand('~/.vimwinpos')
augroup SaveWindow
  autocmd!
  autocmd VimLeavePre * call s:save_window()
  function! s:save_window()
    let options = [
      \ 'set columns=' . &columns,
      \ 'set lines=' . &lines,
      \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
      \ ]
    call writefile(options, g:save_window_file)
  endfunction
augroup END

if filereadable(g:save_window_file)
  execute 'source' g:save_window_file
endif
