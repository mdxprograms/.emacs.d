(package-initialize)
(require 'package)
(add-to-list 'package-archives
    '("melpa" . "http://melpa.milkbox.net/packages/") t)

(dolist (package '(use-package))
   (unless (package-installed-p package)
     (package-install package)))

(setq inhibit-startup-screen t)

(if (display-graphic-p)
    (setq initial-frame-alist
	  '(
	    (tool-bar-lines . 0)))
  (setq initial-frame-alist '((tool-bar-lines . 0))))

(setq default-frame-alist initial-frame-alist)

(setq default-frame-alist '((font . "Hack-13")))

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8-unix)

(setq-default
 auto-save-default nil
 create-lockfiles nil
 custom-file "~/.emacs.d/.custom.el"
 history-length 1000
 indent-tabs-mode nil
 make-backup-files nil
 ring-bell-function 'ignore
 truncate-lines t)

(column-number-mode 1)
(global-hl-line-mode 1)
(global-display-line-numbers-mode)

(setq python-shell-interpreter "python3")

(use-package all-the-icons
  :ensure t)

(use-package autopair
  :ensure t
  :config
  (autopair-global-mode))

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package evil-escape
  :ensure t
  :config
  (setq-default evil-escape-key-sequence "jf")
  (evil-escape-mode))

(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "f" 'helm-projectile-find-file
    "r" 'helm-buffers-list
    "p" 'helm-projectile-switch-project
    "w" 'save-buffer
    "q" 'kill-current-buffer
    "gs" 'magit-status
    "<SPC>" (lambda() (interactive)(find-file "~/.emacs.d/init.el"))
    "TAB" 'mode-line-other-buffer
    "t" 'treemacs))

(use-package magit
  :ensure t)

(use-package evil-magit
  :ensure t)

(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  :config
  (setq elpy-modules (delq 'eplpy-module-flymake elpy-modules)))

(use-package flycheck
  :ensure t
  :config
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(use-package py-autopep8
  :ensure t
  :config
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))

(use-package blacken
  :ensure t)

(use-package pipenv
  :ensure t
  :hook (python-mode . pipenv-mode)
  :init
  (setq pipenv-projectile-after-switch-function
        #'pipenv-projectile-after-switch-extended))

(use-package helm
  :ensure t
  :config
  (helm-mode 1))

(use-package helm-projectile
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (projectile-mode 1))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package treemacs
  :ensure t)

(use-package treemacs-evil
  :ensure t)

(use-package treemacs-projectile
  :ensure t)

;; new snippets in ~/.emacs.d/snippets
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t)

(use-package dracula-theme
  :ensure t
  :config
  (load-theme 'dracula t))
