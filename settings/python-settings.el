;;; package --- python-settings.el

;;; Commentary:

;;; Code:

;;; settings
(setq python-shell-interpreter "ipython3")

;;; packages
(use-package blacken
  :ensure t)

(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  :config
  (setq elpy-modules (delq 'eplpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(use-package py-autopep8
  :ensure t
  :config
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))

(use-package pipenv
  :ensure t
  :hook (python-mode . pipenv-mode)
  :init
  (setq pipenv-projectile-after-switch-function
        #'pipenv-projectile-after-switch-extended))

(provide 'python-settings)
