;;;; edit

;; avoid tab and prefer 2 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; C-RET to select rectangle
(cua-mode t)
(setq cua-enable-cua-keys nil)

;;;; backup
;; make backup in specified directory
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
            backup-directory-alist))
;; recommended deleting obsolete files. for example,
;; $ find ~/.emacs.d/backup -mtime +30 -print0 | xargs -0 rm -f

;;;; recentf
(setq recentf-max-saved-items 2000)
(setq recentf-auto-cleanup 'never)
(setq recentf-exclude '("/recentf"))
(setq recentf-auto-save-timer (run-with-idle-timer 60 t 'recentf-save-list))
(recentf-mode 1)

;;;; auto-complete
(use-package auto-complete
  :hook prog-mode
  :config
  (ac-config-default)
  (setq ac-use-menu-map t)  ;; C-n/C-p to select a candidate
  :bind
  (("C-q" . auto-complete)))

;;;; anzu
(use-package anzu
  :config
  (global-anzu-mode +1)
  :bind
  (([remap query-replace] . anzu-query-replace)
   ([remap query-replace-regexp] . anzu-query-replace-regexp)))

;;;; highlight-symbol
(use-package highlight-symbol
  :hook prog-mode
  :init
  (add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)
  :config
  (setq highlight-symbol-idle-delay 0.5)
  :bind
  (("M-s M-r" . highlight-symbol-query-replace)))

;;;; isearch
;; search with selected region
;;   reference: http://swiftlife.hatenablog.jp/entry/2016/02/21/144716
(defadvice isearch-mode (around isearch-mode-default-string
                                (forward &optional regexp op-fun recursive-edit word-p)
                                activate)
  (if (and transient-mark-mode mark-active (not (eq (mark) (point))))
      (progn
        (isearch-update-ring (buffer-substring-no-properties (mark) (point)))
        (deactivate-mark)
        ad-do-it
        (if (not forward)
            (isearch-repeat-backward)
          (goto-char (mark))
          (isearch-repeat-forward)))
    ad-do-it))

;;;; things-at-point
(setq thing-type-default 'symbol)
(defun input-thing-type ()
  (let ((key (read-key
              "Select type (default symbol): [w]ord [l]ine [f]unction [s]entence [p]aragraph")))
    (cond ((char-equal ?w key) 'word)
          ((char-equal ?l key) 'line)
          ((char-equal ?f key) 'defun)
          ((char-equal ?s key) 'sentence)
          ((char-equal ?p key) 'paragraph)
          (t nil))))
(defun mark-thing-at-point-smart (&optional univ-arg)
  "Mark a thing at point smartly.
  You can select a type of the thing with universal argument (C-u).
  At the beginning or the end of a line, mark the line.
  Otherwise, mark a thing of THING-TYPE-DEFAULT type."
  (interactive "P")
  (let (boundaries thing))
    (setq thing (cond (univ-arg (input-thing-type))
                      ;; ((or (eq (point) (line-beginning-position))
                           ;; (eq (point) (line-end-position))) 'line)
                      (t thing-type-default)))
    (if (eq thing nil) nil
      (progn (setq boundaries (bounds-of-thing-at-point thing))
             (set-mark (car boundaries))
             (goto-char (cdr boundaries)))))
(global-set-key (kbd "C-t") 'mark-thing-at-point-smart)
