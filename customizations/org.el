;; Deft shortcuts
(setq deft-extensions '("org" "md" "txt" "rtf"))
(setq deft-directory "~/Documents/org/deft")
(setq deft-recursive t)
(setq deft-use-filename-as-title t)
(setq deft-use-filter-string-for-filename t)
(setq deft-org-mode-title-prefix t)
(setq deft-auto-save-interval nil)
(setq deft-file-naming-rules
      '((noslash . "-")
        (nospace . "-")
        (case-fn . downcase)))

;; org bullets
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/Documents/Work/org/inbox.org")
               "* TODO %?\n%U\n%a\n")
              ("w" "Write Something"
               entry (file+datetree "~/Documents/Work/org/scraps.org")
               "* %?"
               :empty-lines 1)
              ("n" "note" entry (file "~/Documents/Work/org/inbox.org")
               "* %? :NOTE:\n%U\n%a\n"))))
