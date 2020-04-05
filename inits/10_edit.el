;;;; edit
(setq read-file-name-completion-ignore-case t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; C-RET to select rectangle, M-n to insert sequence number
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; delete selected region
(delete-selection-mode t)

;; no backup
(setq make-backup-files nil)
