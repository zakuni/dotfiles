(add-to-list 'load-path "~/.emacs.d/scala-mode")
; (require 'scala-mode-auto) ;;これが使えれば下２行は必要ないはずだが、エラーになるのでとりあえずコメントアウトしておく。
(require 'scala-mode)
(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))

(require 'scala-mode-feature-electric)
(add-hook 'scala-mode-hook
  (lambda ()
    (scala-electric-mode)))