;;;; display

;; theme
(use-package ample-theme
  :defer t
  :init
  (load-theme 'ample t t)
  (load-theme 'ample-flat t t)
  (load-theme 'ample-light t t)
  (enable-theme 'ample-flat)
  :custom-face
  (region ((nil (:background "#44040")))))

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
  :ensure nil
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
(use-package display-line-numbers
  :ensure nil
  :hook
  (after-init . global-display-line-numbers-mode)
  :custom-face
  (line-number ((nil (:inherit font-lock-comment-face))))
  (line-number-current-line ((nil (:inherit font-lock-keyword-face)))))

;;;; rainbow-delimiters
(use-package rainbow-delimiters
  :diminish
  :hook
  (prog-mode . rainbow-delimiters-mode))

(use-package whitespace
  :diminish global-whitespace-mode
  :hook
  (after-init . global-whitespace-mode)
  :custom
  (whitespace-style '(face
                      trailing
                      tabs
                      empty
                      tab-mark))
  :custom-face
  (whitespace-trailing ((nil (:background "#BC8F8F"))))
  (whitespace-empty ((nil (:background "#334433")))))
