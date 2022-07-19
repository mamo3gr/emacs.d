;;;; auto-highlight-symbol
(use-package auto-highlight-symbol
  :hook
  (after-init . global-auto-highlight-symbol-mode)
  :custom
  (ahs-case-fold-search nil)
  :bind
  ("M-n" . ahs-forward)
  ("M-p" . ahs-backward))
