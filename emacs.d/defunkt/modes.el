;; others
(load "defunkt/dired")
(load "defunkt/ruby")
(load "defunkt/shell")

;; emacs
(define-key emacs-lisp-mode-map (kbd "A-r") 'eval-buffer)

; bash
(setq auto-mode-alist (cons '("\\.bashrc" . sh-mode) auto-mode-alist))

; css
(setq css-mode-indent-depth 2)
(add-hook 'css-mode-hook '(lambda ()
                            (define-key css-mode-map [tab] 'defunkt-indent)))


; yaml
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
    '(lambda ()
       (define-key yaml-mode-map "\C-m" 'newline-and-indent)))


;; textmate.el
(add-to-list 'load-path "~/.emacs.d/vendor/textmate.el")
(require 'textmate)
(textmate-mode)
(require 'peepopen)
