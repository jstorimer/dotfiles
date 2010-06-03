; general
(global-set-key "\C-x\C-b" 'buffer-menu)
(global-set-key "\M-z" 'defunkt-zap-to-char)
(global-set-key "\C-R" 'replace-string)
(global-set-key (kbd "A-F") 'ack)

;; no printing!
;; no changing meta key!!
(when (boundp 'osx-key-mode-map)
  ;; Option is my meta key.
  (define-key osx-key-mode-map (kbd "A-;")
    '(lambda () (interactive) (message "noop")))

  ;; What's paper?
  (define-key osx-key-mode-map (kbd "A-p")
    '(lambda () (interactive) (message "noop"))))

; no mailing!
(global-unset-key (kbd "C-x m"))
(global-unset-key "\C-z")
