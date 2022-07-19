;;;; keybind

;; C-h is Backspace
;; Reference: http://www.fan.gr.jp/~ring/Meadow/meadow.html#back-space
(keyboard-translate ?\C-h ?\C-?)

;; use F1 instead of C-h
(define-key (current-global-map) (kbd "<f1>") 'help-command)

;; move to mini-buffer when isearch
(define-key isearch-mode-map (kbd "C-\\") 'isearch-edit-string)

;; kill current buffer (skip confirmation)
(define-key (current-global-map) (kbd "C-x k") 'kill-this-buffer)

(define-key (current-global-map) (kbd "M-i") 'indent-region)
(define-key (current-global-map) (kbd "M-g") 'goto-line)
