;;; package --- web.el

;;; Commentary:

;;; Code:
;;; settings

;;; packages
(use-package company-web
  :ensure t
  :init
  (require 'company-web-html)
  (require 'company-web-jade))

(use-package css-mode
  :ensure t
  :config
  (setq css-indent-offset 2))

(use-package emmet-mode
  :ensure t
  :config
  (add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2)))
  (add-hook 'html-mode-hook 'emmet-mode)
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook  'emmet-mode)
  (add-hook 'scss-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook 'emmet-mode)
  (add-hook 'rjsx-mode-hook 'emmet-mode)
  (add-hook 'pug-mode-hook 'emmet-mode)
  (setq emmet-move-cursor-between-quotes t
        emmet-self-closing-tag-style " /"))

(use-package json-mode
  :ensure t
  :config
  (add-hook 'json-mode-hook
            (lambda ()
              (make-local-variable 'js-indent-level)
              (setq js-indent-level 2))))

(use-package pug-mode
  :ensure t
  :config
  (setq pug-tab-width 2))

(use-package prettier-js
  :ensure t
  :config
  (add-hook 'rjsx-mode-hook 'prettier-js-mode))

(use-package rjsx-mode
  :ensure t
  :mode ("\\.js$" . rjsx-mode)
  :config
  (add-hook 'rjsx-mode-hook
            (lambda ()
              (setq indent-tabs-mode nil)
              (setq js-indent-level 2))))

(use-package scss-mode
  :ensure t
  :mode ("\\.scss\\'" . scss-mode))

(use-package web-mode
  :ensure t
  :init (progn
          (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
          (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
          (add-to-list 'auto-mode-alist '("\\.twig\\'" . web-mode))
          (add-to-list 'auto-mode-alist '("\\.tag\\'" . web-mode)))
  :config (progn
            (add-hook 'web-mode-hook
                      (lambda ()
                        (setq web-mode-enable-css-colorization t)
                        (setq web-mode-markup-indent-offset 2)
                        (setq web-mode-style-padding 2)
                        (setq web-mode-script-padding 2)
                        (set (make-local-variable 'company-backends) '(company-web-html))
                        (hl-tags-mode)))))

(use-package yaml-mode
  :ensure t)

(provide 'web)
