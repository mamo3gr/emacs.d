;;;; org-mode

(use-package org
  :commands org-agenda
  :config
  (setq system-time-locale "C")  ;; to avoid Japanese in the time stamp
  (setq org-hide-leading-stars t)
  (setq org-startup-folded nil)
  (setq org-return-follows-link t)  ;; RET to follow link
  (setq org-log-done 'time)         ;; add a time stamp to the task when done
  (setq org-todo-keywords
        '((sequence "TASK(t)" "WAIT(w)" "|" "DONE(d)" "ABORT(a)" "SOMEDAY(s)")))
  (setq org-tag-alist '(("PROJECT" . ?p) ("MEMO" . ?m)))
  (setq org-refile-targets '(nil :maxlevel . 1))
  (setq org-capture-templates
        '(("t" "Task" entry (file+headline org-default-notes-file "inbox")
           "** TODO %?\n   CREATED: %U\n")
          ("t" "Idea" entry (file+headline org-default-notes-file "idea")
           "** %?\n   CREATED: %U\n")))
  (setq org-agenda-custom-commands
        '(("x" "Unscheduled Tasks" tags-todo
           "-SCHEDULED>=\"<today>\"-DEADLINE>=\"<today>\"" nil)
          ("d" "Daily Tasks" agenda ""
           ((org-agenda-span 1)))))
  (defadvice org-agenda-switch-to (after org-agenda-close)
    "Close a org-agenda frame when RET is hit on the frame."
    (progn (delete-other-windows)
           (recenter-top-bottom)))
  (ad-activate 'org-agenda-switch-to)
  :init
  (setq org-directory "~/org/")
  (setq org-default-notes-file "main.org")
  (setq org-agenda-files (list org-directory))
  (defun gtd ()
    (interactive)
    (find-file (concat org-directory org-default-notes-file)))
  :bind
  (("C-c a" . org-agenda)
   ("C-c c" . org-capture)
   ("C-c g" . gtd)
   :map org-mode-map
   ("C-m" . org-return-indent)
   ("M-n" . org-forward-same-level)
   ("M-p" . org-backward-same-level)))
