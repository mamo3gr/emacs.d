;;;; mozc
(use-package mozc
  :custom
  (default-input-method "japanese-mozc")
  :config
  (set-language-environment "Japanese")
  :bind
  ("C-j" . togge-input-method))
