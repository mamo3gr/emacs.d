;;;; keybind

;; C-h is Backspace
;; Reference: http://www.fan.gr.jp/~ring/Meadow/meadow.html#back-space
(keyboard-translate ?\C-h ?\C-?)

;; use F1 instead of C-h
(keymap-global-set "<f1>" 'help-command)

;; move to mini-buffer when isearch
(keymap-set isearch-mode-map "C-\\" 'isearch-edit-string)

;; kill current buffer (skip confirmation)
(keymap-global-set "C-x k" 'kill-current-buffer)

(keymap-global-set "M-i" 'indent-region)
;(keymap-set (current-global-map) (kbd "M-g") 'goto-line)

;; bind C-x d to dired-jump (C-x C-j by default) instead of dired
(keymap-global-set "C-x d" 'dired-jump)

;; for MacOS
(setq mac-command-key-is-meta nil)
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)
