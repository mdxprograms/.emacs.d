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

(use-package shakespeare-mode
  :ensure t)

(provide 'hs)
