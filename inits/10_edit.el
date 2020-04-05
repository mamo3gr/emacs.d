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

;;;; Wrapper of comment-dwim
;; Reference: http://www.opensubscriber.com/message/emacs-devel@gnu.org/10971693.html
(defun comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
  If no region is selected and current line is not blank
  and we are not at the end of the line, then comment current line.
  Replaces default behaviour of comment-dwim,
  when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key (kbd "C-c ;") 'comment-dwim-line)
(global-set-key (kbd "M-;") 'comment-dwim-line)
