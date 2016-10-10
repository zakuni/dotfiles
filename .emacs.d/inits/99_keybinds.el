; command key を metaキーに
(when (eq system-type 'darwin)
  (setq ns-command-modifier (quote meta)))

; フルスクリーンショートカットキー
(global-set-key "\C-x;" 'toggle-frame-fullscreen)

; undoショートカットキー
(global-set-key "\C-u" 'undo)

(global-set-key (kbd "M-x") 'smex)

;(setq indent-line-function 'indent-relative-maybe)
(global-set-key "\C-m" 'newline-and-indent); Returnキーで改行＋オートインデント
;(global-set-key "\C-m" 'indent-new-comment-line); Returnキーで改行＋オートインデント＋コメント行
