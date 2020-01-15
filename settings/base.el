;;; package -- base.el

;;; Commentary:

;;; Code:

;;; settings
(setq inhibit-startup-screen t)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq default-frame-alist '((font . "Hack-13")))

(set-charset-priority 'unicode)
(setq locale-coding-system   'utf-8)
(set-terminal-coding-system  'utf-8)
(set-keyboard-coding-system  'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system        'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

(setq-default
 auto-save-default nil
 create-lockfiles nil
 custom-file "~/.emacs.d/.custom.el"
 history-length 1000
 indent-tabs-mode nil
 make-backup-files nil
 ring-bell-function 'ignore
 truncate-lines t)

(setq create-lockfiles nil)

(column-number-mode 1)
(global-hl-line-mode 1)
(global-display-line-numbers-mode)

;;; packages
(use-package all-the-icons
  :ensure t)

(use-package auto-complete
  :ensure t
  :config
  (ac-config-default))

(use-package autopair
  :ensure t
  :config
  (autopair-global-mode))

(use-package company
  :ensure t
  :diminish
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-idle-delay 0))

(use-package dracula-theme
  :ensure t
  :config
  (load-theme 'dracula t))

(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package evil-commentary
  :ensure t
  :config
  (evil-commentary-mode))

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
    "c <SPC>" 'evil-commentary-line
    "q" 'kill-buffer-and-window
    "gs" 'magit-status
    "<SPC>" (lambda() (interactive)(find-file "~/.emacs.d/init.el"))
    "TAB" 'mode-line-other-buffer
    "t" 'treemacs
    "d" 'dired
    "n" 'other-window))

(use-package evil-magit
  :ensure t)

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package flycheck
  :ensure t
  :config
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint))))

(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode t))

(use-package helm
  :ensure t
  :config
  (helm-mode 1))

(use-package helm-projectile
  :ensure t)

(use-package magit
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (projectile-mode 1))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package saveplace
  :ensure t
  :config
  (save-place-mode t)
  (progn
    (setq-default save-place t)
    (setq save-place-limit nil)))

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

(provide 'base)
