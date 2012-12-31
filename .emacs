(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(background-color "#fcf4dc")
 '(background-mode light)
 '(cursor-color "#fcf4dc")
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(foreground-color "#52676f")
 '(split-width-threshold 100))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/"))
(add-to-list 'load-path "~/.emacs.d/plugins/")
(add-to-list 'load-path (expand-file-name "~/elisp/"))
(add-to-list 'load-path "~/.emacs.d/auto-install/")
(add-to-list 'load-path "~/elisp/emacs-color-theme-solarized/")

(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")

;; 00 一般設定
;; 30 追加機能系
;; 50 メジャーモード

;;(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/howm")
;;(setq howm-menu-lang 'ja)
;;(require 'howm)


;; Terminal上での設定
(if window-system
    (color-theme-initialize)
;;  (color-theme-blippblopp) 
;;  (color-theme-clarity)
;;  (color-theme-dark-font-lock)
;;  (color-theme-lawrence)
;;  (color-theme-resolve)
;;  (color-theme-hober)
;;  (color-theme-billw)
    (color-theme-solarized-dark)

;; Command-Key and Option-Key
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))


)

(set-cursor-color "red")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Beginning of the el4r block:
;; RCtool generated this block automatically. DO NOT MODIFY this block!
;;(add-to-list 'load-path "/Users/zakuni/.rvm/rubies/ruby-1.9.3-p125/share/emacs/site-lisp")
;;(require 'el4r)
;;(el4r-boot)
;; End of the el4r block.
;; User-setting area is below this line.
