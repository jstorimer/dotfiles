(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(prefer-coding-system 'utf-8)

;; works in both aquamacs and carbon
(when (functionp 'tool-bar-mode)
  (tool-bar-mode -1))

;; aquamacs specific
(when (boundp 'aquamacs-version)
  (one-buffer-one-frame-mode 0))
