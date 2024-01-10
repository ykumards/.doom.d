;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
(setq max-lisp-eval-depth 5000) ; or a higher value if needed

(setq shell-file-name (executable-find "bash"))
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Yogesh Kumar"
      user-mail-address "ykumards@gmail.com"
      doom-scratch-initial-major-mode 'lisp-interaction-mode
      doom-theme 'doom-one
      display-line-numbers-type t
      load-prefer-newer t
      search-highlight t
      search-whitespace-regexp ".*?")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
(setq doom-font (font-spec :family "JetBrains Mono" :size 14 :weight 'semi-light))

;; ===========
;; Org Mode
;; ===========
(setq org-directory "~/Documents/org/")
(setq org-default-notes-file "~/Documents/org/inbox.org")
(setq org-indent-mode t
      org-startup-with-inline-images t)
(add-hook 'org-mode-hook 'org-bullets-mode)
(setq org-bullets-bullet-list '("•"))
(setq org-pretty-entities t)
; Deft shortcuts
(setq deft-extensions '("org" "md" "txt" "rtf")
      deft-directory "~/Documents/org/notes"
      deft-recursive t
      deft-use-filename-as-title t
      deft-use-filter-string-for-filename  t
      deft-org-mode-title-prefix t
      deft-auto-save-interval 5.0)
(setq deft-file-naming-rules
      '((noslash . "-")
        (nospace . "-")
        (case-fn . downcase)))

; org-journal
(use-package! org-journal
  :custom
  (org-journal-date-prefix "#+TITLE: ")
  (org-journal-time-prefix "* ")
  (org-journal-file-format "%Y-%m-%d.org")
  (org-journal-dir "~/Documents/org/journal/")
  (org-journal-date-format "%A, %d %B %Y")
  (org-journal-time-format " %I:%M %p : "))
(after! org-journal
  (map! :leader
        (:prefix-map ("j" . "journal")
         :desc "Open calendar" "c" #'calendar
         :desc "New journal entry" "j" #'org-journal-new-entry
         :desc "Search all entries" "s" #'org-journal-search
         :desc "Next entry" "n" #'org-journal-next-entry
         :desc "Previous entry" "p" #'org-journal-previous-entry
         :desc "Open current entry" "o" #'org-journal-open-current-journal-file)))
;; The built-in calendar mode mappings for org-journal
;; conflict with evil bindings
(map!
 (:map calendar-mode-map
   :n "o" #'org-journal-display-entry
   :n "p" #'org-journal-previous-entry
   :n "n" #'org-journal-next-entry
   :n "O" #'org-journal-new-date-entry))
(after! calendar
  (defun org-journal-save-entry-and-exit()
    "Simple convenience function.
    Saves the buffer of the current day's entry and kills the window.
    Similar to org-capture like behavior."
    (interactive)
    (save-buffer)
    (kill-buffer-and-window))

  (map! :map org-journal-mode-map
        :localleader
        "s" #'org-journal-save-entry-and-exit))


;; Org Roam

(setq org-roam-directory "~/Documents/org/roam/"
      org-roam-v2-ack t
      org-roam-completion-everywhere t)
(org-roam-db-autosync-mode)
(map! :leader
      (:prefix-map ("r" . "roam")
       :desc "Find file" "f" #'org-roam-node-find
       :desc "Show graph" "g" #'org-roam-graph
       :desc "Insert link" "i" #'org-roam-node-insert
       :desc "Create daily entry for a date" "d" #'org-roam-dailies-capture-date
       :desc "Create daily entry for today" "t" #'org-roam-dailies-capture-today
       :desc "Capture" "c" #'org-roam-capture))


;; Don't zoom editor in zen mode
;;
(setq +zen-text-scale 0)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq mac-command-modifier 'control)
;; Turn off the menu bar at the top of each frame because it's distracting
(menu-bar-mode -1)
;; You can uncomment this to remove the graphical toolbar at the top. After
;; awhile, you won't need the toolbar.
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))


;; ;; Better scrolling
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; =============
;; Shortcuts
;; =============

;;windmove
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; M-x binding to satiate muscle memory
(global-set-key (kbd "C-x RET") 'execute-extended-command)
;; Toggle treemacs
(global-set-key (kbd "C-c n") 'treemacs)
;; Markdown related settings
(setq markdown-toggle-math t)

;; Projectile
(setq projectile-mode-line "Projectile")
(setq projectile-enable-caching t)

;; vterm
(setq vterm-shell "/opt/homebrew/bin/zsh")

;; TRAMP
(setq tramp-auto-save-directory "~/tmp/tramp/")
(setq tramp-chunksize 2000)
(setq tramp-default-method "sshx")
(setq treemacs-project-follow-cleanup nil)
