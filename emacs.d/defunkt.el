(add-to-list 'load-path "~/.emacs.d/vendor")

(setq custom-file "~/.emacs.d/defunkt/custom.el")
(load custom-file)

; custom place to save customizations
(load "defunkt/global")
(load "defunkt/modes")
(load "defunkt/defuns")
(load "defunkt/bindings")
(load "defunkt/theme")

(require 'ack)
(require 'cheat)
(require 'textile-mode)
(require 'yaml-mode)

(require 'peepopen)
