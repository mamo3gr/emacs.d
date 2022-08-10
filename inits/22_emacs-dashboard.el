;;;; emacs-dashboard
(use-package dashboard
  :diminish
  :hook (after-init . dashboard-setup-startup-hook)
  :custom
  (initial-buffer-choice (lambda () (get-buffer-create "*dashboard*"))
                         "show dashboard in frames created with `emacsclient -c`")
  (dashboard-startup-banner "~/.emacs.d/dashboard-startup-banner.txt")
  (dashboard-center-content t)
  (dashboard-items '((recents . 30)))
  (dashboard-footer-icon (all-the-icons-fileicon "emacs"
                                                 :height 0.8
                                                 :v-adjust -0.1
                                                 :face 'font-lock-keyword-face)))
