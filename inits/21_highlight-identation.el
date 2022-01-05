;; highlight-indentation
(use-package highlight-indentation
  :hook
  ((yaml-mode . highlight-indentation-mode)
   (yaml-mode . highlight-indentation-current-column-mode))
  :custom-face
  (highlight-indentation-face ((t (:foreground "DeepPink4"))))
  (highlight-indentation-current-column-face ((t (:foreground "DeepPink4"))))
  )
