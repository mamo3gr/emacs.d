;;;; helm
(use-package helm-config
  :config
  (helm-mode 1)
  :bind
  (("C-x C-f" . helm-find-files)
   ("C-x f"   . helm-recentf)
   ("C-x b"   . helm-buffers-list)
   ("M-x"     . helm-M-x)
   ("M-y"     . helm-show-kill-ring)
   ("M-o"     . helm-occur)
   ("M-r"     . helm-resume)
   :map helm-find-files-map
   ("TAB" . helm-execute-persistent-action)
   :map helm-read-files-map
   ("TAB" . helm-execute-persistent-action)
   :map isearch-mode-map
   ("M-o" . helm-occur-from-isearch)
   :map org-mode-map
   ("C-c h" . helm-org-in-buffer-headings)))
