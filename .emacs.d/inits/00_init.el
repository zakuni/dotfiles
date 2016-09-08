(setq tool-bar-mode 1)

;;shift+矢印キーで範囲選択(emacs 24で廃止)
;(setq pc-select-selection-keys-only t)
;(pc-selection-mode 1)


(setq make-backup-files nil) ;; ~ファイル(バックアップファイル)を生成しない
(setq auto-save-list-file-prefix nil)
(define-key global-map [?¥] [?\\])  ;; ¥の代わりにバックスラッシュを入力する


; カーソルの点滅
(blink-cursor-mode t)

; 言語を日本語にする
(set-language-environment 'Japanese)
; 極力UTF-8とする
(prefer-coding-system 'utf-8)

(setq-default tab-width 2 indent-tabs-mode nil)

;(setq indent-line-function 'indent-relative-maybe)
(global-set-key "\C-m" 'newline-and-indent); Returnキーで改行＋オートインデント
;(global-set-key "\C-m" 'indent-new-comment-line); Returnキーで改行＋オートインデント＋コメント行

; 変更のあったファイルの自動再読み込み
(global-auto-revert-mode 1)
