;;;; markdown
;; you must install github-markup adn commonmarker:
;;   $ gem install github-markup commonmarker
(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :custom
  (markdown-command "github-markup")
  (markdown-command-needs-filename t))
