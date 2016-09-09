(require 'color-theme)
(require 'color-theme-solarized)
(require 'color-theme-tomorrow)
;;(load-theme 'solarized-[light|dark] t)
(color-theme-initialize)
;;(color-theme-clarity)
;;(color-theme-andreas)
;;(color-theme-aliceblue)
;;(color-theme-blippblopp)
;(color-theme-tomorrow-night-eighties)
(load-file "~/.emacs.d/themes/color-theme-railscasts.el")
(color-theme-railscasts)

;; solarized
;(color-theme-solarized-dark)
;(add-hook 'window-setup-hook '(lambda () (set-cursor-color "gray")))
;(add-hook 'after-make-frame-functions '(lambda (f) (with-selected-frame f (set-cursor-color "gray"))))

;(set-cursor-color "red")

(require 'hl-line)
(custom-set-faces 
 '(hl-line
   ((((class color)
      (background dark))
     (:background "#775511"))
    (((class color)
      (background light))
     (:background "555555")))))
(global-hl-line-mode)

(custom-set-variables
 '(split-width-threshold 100) 
)

(when (>= emacs-major-version 23)
 (set-face-attribute 'default nil
                     :family "monaco"
                     :height 140)
 (set-fontset-font
  (frame-parameter nil 'font)
  'japanese-jisx0208
  '("ヒラギノ角ゴ Pro" . "iso10646-1"))
 (set-fontset-font
  (frame-parameter nil 'font)
  'japanese-jisx0212
  '("ヒラギノ角ゴ Pro" . "iso10646-1"))
 (set-fontset-font
  (frame-parameter nil 'font)
  'mule-unicode-0100-24ff
  '("monaco" . "iso10646-1"))
 (setq face-font-rescale-alist
      '(("^-apple-hiragino.*" . 1.2)
        (".*osaka-bold.*" . 1.2)
        (".*osaka-medium.*" . 1.2)
        (".*courier-bold-.*-mac-roman" . 1.0)
        (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
        (".*monaco-bold-.*-mac-roman" . 0.9)
        ("-cdac$" . 1.3))))

(setq whitespace-style
      '(tabs tab-mark spaces space-mark))
(setq whitespace-space-regexp "\\(\x3000+\\)")
(setq whitespace-display-mappings
      '((space-mark ?\x3000 [?\□])
        (tab-mark   ?\t   [?\xBB ?\t])
        ))
(require 'whitespace)
(global-whitespace-mode 1)
(set-face-foreground 'whitespace-space "LightSlateGray")
(set-face-background 'whitespace-space "DarkSlateGray")
(set-face-foreground 'whitespace-tab "LightSlateGray")
(set-face-background 'whitespace-tab "DarkSlateGray")

(global-linum-mode)

(set-frame-parameter nil 'alpha 90)
(toggle-frame-fullscreen)

