
; フルスクリーンショートカットキー
(global-set-key "\C-x;" 'ns-toggle-fullscreen)

; undoショートカットキー
(global-set-key "\C-u" 'undo)

;; helm ショートカット
(global-set-key (kbd "C-;") 'helm-mini)
(global-set-key (kbd "C-'") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)

;(setq indent-line-function 'indent-relative-maybe)
(global-set-key "\C-m" 'newline-and-indent); Returnキーで改行＋オートインデント
;(global-set-key "\C-m" 'indent-new-comment-line); Returnキーで改行＋オートインデント＋コメント行