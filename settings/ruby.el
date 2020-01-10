;;; package --- ruby.el

;;; Commentary:

;;; Code:

;;; packages
(use-package bundler
  :ensure t)

(use-package inf-ruby
  :ensure t)

(use-package robe
  :ensure t
  :config
  (add-hook 'ruby-mode-hook 'robe-mode)
  (add-to-list 'company-backends 'company-robe))

(use-package rubocop
  :ensure t)

(use-package rvm
  :ensure t)

(provide 'ruby)
