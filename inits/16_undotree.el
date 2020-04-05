;;;; undo-tree
(use-package undo-tree
  :config
  (global-undo-tree-mode 1)
  :bind
  ([remap undo] . undo-tree-undo)
  ("M-/" . undo-tree-redo)
  ;; ("C-x u" . undo-tree-visualize)  ;; binded by default
  )
