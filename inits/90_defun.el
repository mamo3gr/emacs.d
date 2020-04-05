;;;; useful functions

;; Ref: https://emacs.stackexchange.com/questions/31646/how-to-paste-with-indent
(defun yank-with-indent ()
  (interactive)
  (let ((indent
         (buffer-substring-no-properties (line-beginning-position) (line-end-position))))
    (message indent)
    (yank)
    (save-excursion
      (save-restriction
        (narrow-to-region (mark t) (point))
        (pop-to-mark-command)
        (replace-string "\n" (concat "\n" indent))
        (widen)))))
(define-key global-map (kbd "C-c y") 'yank-with-indent)

;; Ref: https://emacs.stackexchange.com/questions/34966/copy-region-without-leading-indentation
(defun my-copy-region-unindented (pad beginning end)
  "Copy the region, un-indented by the length of its minimum indent.

If numeric prefix argument PAD is supplied, indent the resulting
text by that amount."
  (interactive "P\nr")
  (let ((buf (current-buffer))
        (itm indent-tabs-mode)
        (tw tab-width)
        (st (syntax-table))
        (indent nil))
    (with-temp-buffer
      (setq indent-tabs-mode itm
            tab-width tw)
      (set-syntax-table st)
      (insert-buffer-substring buf beginning end)
      ;; Establish the minimum level of indentation.
      (goto-char (point-min))
      (while (and (re-search-forward "^[[:space:]\n]*" nil :noerror)
                  (not (eobp)))
        (let ((length (current-column)))
          (when (or (not indent) (< length indent))
            (setq indent length)))
        (forward-line 1))
      (if (not indent)
          (error "Region is entirely whitespace")
        ;; Un-indent the buffer contents by the length of the minimum
        ;; indent level, and copy to the kill ring.
        (when pad
          (setq indent (- indent (prefix-numeric-value pad))))
        (indent-rigidly (point-min) (point-max) (- indent))
        (copy-region-as-kill (point-min) (point-max))))))
