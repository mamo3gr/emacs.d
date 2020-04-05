;;;; company
(use-package company
  :hook (prog-mode . company-mode)
  :custom
  (completion-ignore-case t)
  (company-dabbrev-downcase nil)  ;; do not downcase the returned candidates
  (company-idle-delay 0)
  (company-minimum-prefix-length 2)
  (company-selection-wrap-around t)
  :bind
  (:map company-active-map
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous)
        ("C-s" . company-filter-candidates)
        ("C-i" . company-complete-selection)
        ([?\t] . company-complete-selection))
  (:map company-search-map
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous)
        ("C-i" . company-complete-selection)
        ([?\t] . company-complete-selection))
  )
