;;;; keybind

;; C-h is Backspace
;;   reference: http://www.fan.gr.jp/~ring/Meadow/meadow.html#back-space
(keyboard-translate ?\C-h ?\C-?)
;; C-\ to move to mini-buffer when isearch
(define-key isearch-mode-map (kbd "C-\\") 'isearch-edit-string)
;; C-x k to kill current buffer (without confirmation)
(global-set-key (kbd "C-x k") 'kill-this-buffer)

(global-set-key (kbd "M-i") 'indent-region)
