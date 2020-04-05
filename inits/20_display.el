;;;; display

;; theme
(use-package ample-theme
  :init (progn (load-theme 'ample t t)
               (load-theme 'ample-flat t t)
               (load-theme 'ample-light t t)
               (enable-theme 'ample-flat))
  :defer t)

;; frame
(menu-bar-mode 0)
(tool-bar-mode 0)
(setq default-frame-alist
      (append '((font . "Cica-16")
                (width . 95)
                (height . 50))
              default-frame-alist))

;; buffer
(setq inhibit-startup-message t)

;; modeline
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

(setq line-number-mode t)
(setq column-number-mode t)

;; minibuffer
(fset 'yes-or-no-p 'y-or-n-p)

;; frange
(setq-default indicate-empty-lines t)
(setq-default indicate-buffer-boundaries 'left)

;; cursor
(blink-cursor-mode -1)

;;;; paren
(use-package paren
  :config
  (show-paren-mode 1)
  :custom
  (show-paren-style 'parenthesis))

;;;; uniquify
;(setq uniquify-buffer-name-style 'post-forward-angle-brackets)  ;; filename<dir>
(setq uniquify-buffer-name-style 'forward)                       ;; dir/filename
(setq uniquify-strip-common-suffix t)
(setq uniquify-min-dir-content 2)

;;;; line-numbers
(if (version<= "26.0.50" emacs-version)
    (progn
      (global-display-line-numbers-mode)
      (set-face-attribute 'line-number nil
                          :inherit font-lock-comment-face)
      (set-face-attribute 'line-number-current-line nil
                          :inherit font-lock-keyword-face)))

;;;; rainbow-delimiters
(use-package rainbow-delimiters
  :diminish
  :hook
  (prog-mode . rainbow-delimiters-mode))

(use-package whitespace
  :config
  (global-whitespace-mode 1)
  :diminish global-whitespace-mode
  :custom
  (whitespace-style '(face
                      trailing
                      tabs
                      empty
                      tab-mark)))
