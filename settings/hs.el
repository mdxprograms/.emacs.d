;;; package --- hs.el

;;; Commentary:

;;; Code:

;;; settings
(use-package haskell-mode
  :ensure t
  :config
  (add-hook 'haskell-mode-hook #'hindent-mode))

(use-package hindent
  :ensure t)

(use-package ghc
  :ensure t
  :init
  (autoload 'ghc-init "ghc" nil t)
  (autoload 'ghc-debug "ghc" nil t)
  (add-hook 'haskell-mode-hook (lambda () (ghc-init))))

(use-package company-ghc
  :ensure t
  :init
  (add-to-list 'company-backends 'company-ghc)
  (custom-set-variables '(company-ghc-show-info t)))

(use-package shakespeare-mode
  :ensure t)

(provide 'hs)
