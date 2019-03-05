;;;; display

;;;; font
(set-face-attribute 'default nil :family "MyricaM M" :height 140)

;;;; theme
(load-theme 'deeper-blue)

;;;; frame
;; hide menu and tool bar
(menu-bar-mode 0)
(tool-bar-mode 0)

;;;; window
;; avoid displaying startup message
(setq inhibit-startup-message t)
;; truncate lines
(setq truncate-lines t)
(setq truncate-partial-width-windows t)
;; scroll by one line
(setq scroll-step 1)
;; avoid blinking cursor
(blink-cursor-mode 0)

;;;; minibuffer
;; yes/no -> y-n
(fset 'yes-or-no-p 'y-or-n-p)

;;;; mode-line
;; show linefeed code
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

;;;; uniquify
(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'forward)  ;; dir/filename
  )

;;;; rainbow-delimiters
(use-package rainbow-delimiters-mode
  :hook prog-mode)

;;;; show-paren-mode
(show-paren-mode 1)
(set-face-attribute 'show-paren-match nil
                    :background nil
                    :underline t
                    :weight 'ultra-bold)
