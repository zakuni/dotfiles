(setq tool-bar-mode 1)
(setq pc-select-selection-keys-only t)
(pc-selection-mode 1)


(setq make-backup-files nil) ;; ~ãƒ•ãÄ„ãÂ¤ãÄ(ãƒãƒƒãÅ»ãË˜ãƒƒãƒ—ãƒ•ãÄ„ãÂ¤ãÄ)ã‚’ç”Ÿæˆã—ãÂªã„
(define-key global-map [?Â¥] [?\\])  ;; Â¥ãÂ®ä»£ã‚Ã£‚cÂ«ãƒãƒƒãÅ»ãÅ¡ãÄ°ãƒƒãË‡ãƒ¥ã‚’åà¸…åŠ›ã™ã‚‹


;;; ãÅ¤ãÄµãËãÄãÂ®çÅ¡æ»…
(blink-cursor-mode t)

; è¨€èªã‚’æõŒ†½œ¬èªãÂ«ã™ã‚‹
(set-language-environment 'Japanese)
; æ¥µåŠ›UTF-8ãÂ¨ã™ã‚‹
(prefer-coding-system 'utf-8)
