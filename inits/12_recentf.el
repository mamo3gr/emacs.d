;;;; recentf
(use-package recentf
  :init
  (recentf-mode 1)
  :custom
  (recentf-max-saved-items 1000)
  (recentf-auto-save-timer (run-with-idle-timer 60 t 'recentf-save-list))
  :bind
  ("C-x f" . recentf-open-files))
