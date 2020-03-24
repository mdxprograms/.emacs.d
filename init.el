(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
    '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(add-to-list 'load-path "~/.emacs.d/settings")

(require 'base)
(require 'python-settings)
(require 'ruby)
(require 'clojure)
(require 'web)
(require 'hs)

