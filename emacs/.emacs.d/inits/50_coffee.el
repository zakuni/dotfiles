(add-to-list 'load-path "~/.emacs.d/elpa/coffee-mode-0.4.1/")
(require 'coffee-mode)

(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))
