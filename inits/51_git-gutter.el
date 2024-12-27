;;;; git-gutter
(use-package git-gutter
  :diminish
  :custom
  (git-gutter:modified-sign "~")
  (git-gutter:added-sign    "+")
  (git-gutter:deleted-sign  "-")
  :custom-face
  (git-gutter:modified ((t (:foreground "#f1fa8c" :background "#818a0c"))))
  (git-gutter:added    ((t (:foreground "#50fa7b" :background "#30da5b"))))
  (git-gutter:deleted  ((t (:foreground "#ff79c6" :background "#df59a6"))))
  :config
  (global-git-gutter-mode 1)
  :bind
  (("C-c d" . git-gutter:popup-hunk)
   ("C-c p" . git-gutter:previous-hunk)
   ("C-c n" . git-gutter:next-hunk)
   ("C-c r" . git-gutter:revert-hunk)))
