(setq tool-bar-mode 1)
(setq pc-select-selection-keys-only t)
(pc-selection-mode 1)


(setq make-backup-files nil) ;; ~フ�Ą�¤�Ğ(バッ�Ż�˘ップフ�Ą�¤�Ğ)を生成し�ªい
(define-key global-map [?¥] [?\\])  ;; ¥�®代�ã�c«バッ�Ż�š�İッ�ˇュを�ฅ力する


;;; �Ť�ĵ�˝�Ğ�®�š滅
(blink-cursor-mode t)

; 言語を�������語�«する
(set-language-environment 'Japanese)
; 極力UTF-8�¨する
(prefer-coding-system 'utf-8)

(setq-default tab-width 2 indent-tabs-mode nil)

;(setq indent-line-function 'indent-relative-maybe)
(global-set-key "\C-m" 'newline-and-indent); Returnキーで改行＋オートインデント
;(global-set-key "\C-m" 'indent-new-comment-line); Returnキーで改行＋オートインデント＋コメント行