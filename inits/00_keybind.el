;;;; keybind

;; C-h is Backspace
;; Reference: http://www.fan.gr.jp/~ring/Meadow/meadow.html#back-space
(keyboard-translate ?\C-h ?\C-?)
;; delete selected region
(delete-selection-mode t)
;; C-\ to move to mini-buffer when isearch
(define-key isearch-mode-map (kbd "C-\\") 'isearch-edit-string)
;; C-x k to kill current buffer (without confirmation)
(global-set-key (kbd "C-x k") 'kill-this-buffer)

(global-set-key (kbd "M-i") 'indent-region)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-m") 'newline-and-indent)
