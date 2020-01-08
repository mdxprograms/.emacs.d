(setq inhibit-startup-screen t)

(if (display-graphic-p)
    (setq initial-frame-alist
	  '(
	    (tool-bar-lines . 0)))
  (setq initial-frame-alist '((tool-bar-lines . 0))))

(setq default-frame-alist initial-frame-alist)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8-unix)

(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq auto-save-default nil)
(setq ring-bell-function 'ignore)

(column-number-mode 1)
(linum-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Install and setup packages;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-initialize)
(require 'package)
(add-to-list 'package-archives
    '("melpa" . "http://melpa.milkbox.net/packages/") t)

(dolist (package '(use-package))
   (unless (package-installed-p package)
     (package-install package)))

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
    "f" 'find-file
    "w" 'save-buffer
    "q" 'kill-current-buffer
    "gs" 'magit-status))

(use-package magit
  :ensure t)

(use-package evil-magit
  :ensure t)

(use-package dracula-theme
  :ensure t
  :config
  (load-theme 'dracula t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (evil-magit magit dracula-theme evil-escape evil-leader evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
