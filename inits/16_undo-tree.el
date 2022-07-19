;;;; undo-tree
(use-package undo-tree
  :config
  (global-undo-tree-mode 1)
  :custom
  (undo-tree-auto-save-history nil "do not save history")
  :bind
  ;; ([remap undo] . undo-tree-undo)  :: binded by default
  ("M-/" . undo-tree-redo)
  ;; ("C-x u" . undo-tree-visualize)  ;; binded by default
  )
