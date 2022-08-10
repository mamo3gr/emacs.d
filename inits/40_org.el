;;;; org
(use-package org
  :mode (("\\.org\\'" . org-mode))
  :init
  (defun my:org-goto-inbox ()
    (interactive)
    (find-file org-default-notes-file))
  :custom
  ;; directory and files
  (org-directory "~/org/")
  (org-default-notes-file (concat org-directory "main.org"))
  (org-agenda-files (list org-directory))
  ;; display
  (org-hide-leading-stars t)
  (org-startup-folded nil)
  ;; edit
  (org-adapt-indentation t)
  (org-return-follows-link t "RET to follow link")
  ;; capture
  (org-todo-keywords
   '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)" "ABORT(a)" "SOMEDAY(s)")))
  (org-tag-alist
   '(("PROJECT" . ?p) ("MEMO" . ?m) ("PETIT" . ?t)))
  (org-capture-templates
   '(("t" "Task" entry (file+headline org-default-notes-file "inbox")
      "** TODO %?\n   CREATED: %U\n")
     ("i" "Idea" entry (file+headline org-default-notes-file "idea")
      "** %?\n   CREATED: %U\n")))
  (org-refile-targets '((org-agenda-files :maxlevel . 1)))
  ;; clock
  (org-log-done 'time "add a time stamp to the task when it is done")
  (org-clock-clocked-in-display 'frame-title)
  ;; agenda
  (org-agenda-time-leading-zero t)
  (org-agenda-custom-commands
   '(("x" "Unscheduled Tasks" tags-todo
      "-SCHEDULED>=\"<today>\"-DEADLINE>=\"<today>\""
      nil)
     ("d" "Daily Tasks" agenda
      ""
      ((org-agenda-span 1)))))
  (org-agenda-skip-scheduled-if-done t)
  (org-agenda-columns-add-appointments-to-effort-sum t)
  (org-agenda-time-grid
   '((daily today require-timed)
     (0900 1200 1300 1800) "......" "----------------"))
  (org-columns-default-format
   "%68ITEM(Task) %6Effort(Effort){:} %6CLOCKSUM(Clock){:}")
  :bind
  (("C-c a" . org-agenda)
   ("C-c c" . org-capture)
   ("C-c g" . org-clock-goto)
   ("C-c i" . my:org-goto-inbox)
   :map org-mode-map
   ("M-n" . org-forward-same-level)
   ("M-p" . org-backward-same-level)
   ))

(use-package org-agenda
  :ensure nil
  :config
  (defadvice org-agenda-switch-to (after org-agenda-close)
    "Close a org-agenda window when RET is hit on the window."
    (progn (delete-other-windows)
           (recenter-top-bottom)))
  (ad-activate 'org-agenda-switch-to)
  :bind
  (:map org-agenda-mode-map
   ("s" . org-agenda-schedule)
   ("S" . org-save-all-org-buffers))
  )
