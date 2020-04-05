(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;;;; use-package
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;;;; init-loader
(require 'init-loader)
(setq inits-dir (expand-file-name "~/.emacs.d/inits/"))
(setq init-loader-show-log-after-init t)
(init-loader-load inits-dir)

;; custom variables is separated from here
(setq custom-file (locate-user-emacs-file "custom.el"))

;; start server
(use-package server
  :ensure nil
  :hook (after-init . server-mode))
