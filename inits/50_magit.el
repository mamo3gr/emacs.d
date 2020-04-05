;;;; magit
(use-package magit
  :bind
  ("C-c m" . magit))

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
  (global-git-gutter-mode 1))
