(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3b0a350918ee819dca209cec62d867678d7dac74f6195f5e3799aa206358a983" default)))
 '(package-selected-packages
   (quote
    (coffee-mode mocha yasnippet web-mode use-package smex smartparens recentf-ext railscasts-theme projectile prodigy popwin pallet nyan-mode neotree multiple-cursors markdown-mode magit init-loader idle-highlight-mode htmlize helm-ls-git git-gutter fuzzy flycheck-pos-tip flycheck-cask expand-region exec-path-from-shell drag-stuff better-defaults auto-complete)))
 '(split-width-threshold 100))

(add-to-list 'load-path "~/.emacs.d/plugins/")
(add-to-list 'load-path "~/.emacs.d/themes/")

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(init-loader-load "~/.emacs.d/inits")

;; 00 一般設定
;; 30 追加機能系
;; 50 メジャーモード


;; Terminal上での設定
(if window-system
;; Command-Key and Option-Key
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((((class color) (background dark)) (:background "#775511")) (((class color) (background light)) (:background "555555")))))
