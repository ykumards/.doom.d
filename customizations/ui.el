;; mac specific
(setq mac-command-modifier 'control)
(setq mac-mouse-wheel-smooth-scroll t)

;; typography
(setq-default line-spacing nil)
(setq mac-allow-anti-aliasing t)
(global-prettify-symbols-mode t)


;; Better scrolling
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)


(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; no bell
(setq ring-bell-function 'ignore)

;; lose the menubar
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Markdown related settings
(setq markdown-toggle-math t)

;; Nyan-mode
(nyan-mode t)
