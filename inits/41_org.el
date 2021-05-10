;;;; org
(use-package org
  :custom
  (system-time-locale "C")
  (org-hide-leading-stars t)
  (org-startup-folded nil)
  (org-todo-keywords
   '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)" "ABORT(a)" "SOMEDAY(s)")))
  )
