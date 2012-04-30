(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path (expand-file-name "~/elisp"))
(add-to-list 'load-path "~/.emacs.d/auto-install")
(add-to-list 'load-path "~/elisp/emacs-color-theme-solarized")

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
