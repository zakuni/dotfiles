;;shift+矢印キーで範囲選択(emacs 24で廃止)
;(setq pc-select-selection-keys-only t)
;(pc-selection-mode 1)


(setq make-backup-files nil) ;; ~ファイル(バックアップファイル)を生成しない
(setq auto-save-list-file-prefix nil)
(define-key global-map [?¥] [?\\])  ;; ¥の代わりにバックスラッシュを入力する

; 言語を日本語にする
(set-language-environment 'Japanese)
; 極力UTF-8とする
(prefer-coding-system 'utf-8)

(setq-default tab-width 2 indent-tabs-mode nil)

; 変更のあったファイルの自動再読み込み
(global-auto-revert-mode 1)

;; save-buffer 時，buffer 末尾に空行が常にあるように
(setq require-final-newline t)

;; シンボリックリンクを開くときの質問省略
(setq vc-follow-symlinks t)

(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)
