;;;; keybind

;; C-h is Backspace
;; Reference: http://www.fan.gr.jp/~ring/Meadow/meadow.html#back-space
(keyboard-translate ?\C-h ?\C-?)

;; move to mini-buffer when isearch
(define-key isearch-mode-map (kbd "C-\\") 'isearch-edit-string)

;; kill current buffer (skip confirmation)
(global-set-key (kbd "C-x k") 'kill-this-buffer)

(global-set-key (kbd "M-i") 'indent-region)
(global-set-key (kbd "M-g") 'goto-line)
