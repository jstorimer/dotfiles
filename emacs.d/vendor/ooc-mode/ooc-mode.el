;;; ooc-mode.el --- Major mode for editing .ooc files

;;; Copyright 2009 Eduardo Grajeda Blandón

;;; Author: Eduardo Grajeda Blandón <tatofoo@gmail.com>
;;; Version: 0.1
;;; Keywords: ooc

;;; This mode is a fork of the great pod-mode, created by Steffen Schwigon. 
;;; For more information you can go to:
;;;
;;;   http://github.com/renormalist/emacs-pod-mode

;;; This program is free software; you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 2, or (at your option)
;;; any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program; if not, write to the Free Software
;;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Put this file into your load-path and the following into your ~/.emacs:
;;;
;;;    (require 'ooc-mode)
;;;
;;;
;;; To associate ooc-mode with .ooc files add the following to your ~/.emacs
;;;
;;;    (setq auto-mode-alist
;;;       (append auto-mode-alist
;;;         '(("\\.ooc$" . ooc-mode))))
;;;
;;;
;;; To automatically turn on font-lock-mode add the following to your ~/.emacs
;;;
;;;    (add-hook 'ooc-mode-hook 'font-lock-mode)

;;; Code:

;; default variables
(defvar ooc-mode-hook nil)

;; keymap
(defvar ooc-mode-map nil "Keymap for OOC major mode.")
(if ooc-mode-map nil
  (let ((map (make-sparse-keymap)))
    (define-key map "}" (lambda ()
                          (interactive) (insert "}") (ooc-indent-line)))
    (setq ooc-mode-map map)))

;; syntax highlighting
(defconst ooc-font-lock-keywords
  (list
   (cons "\"\\([^\"\\\\]\\|\\\\.\\)*\"" 'font-lock-string-face)
   (cons (concat "\\<" 
                 (regexp-opt '("class" "cover" "func" "abstract" "from" "this"
                               "super" "new" "const" "static" "include"
                               "import" "break" "continue" "fallthrough"
                               "implement" "override" "if" "else" "for" "while"
                               "do" "switch" "case" "version" "return" "ctype"
                               "typedef" "use" "extends") t)
                 "\\>")
         'font-lock-keyword-face)
   (cons (concat "\\<"
                 (regexp-opt '("Int" "UInt" "Short" "UShort" "Long"
                               "ULong" "LLong" "ULLong" "Char" "UChar"
                               "Int8" "Int16" "Int32" "Int64" "UInt8"
                               "UInt16" "UInt32" "UInt64" "SizeT"
                               "String" "Float") t)
                 "\\>")
         'font-lock-type-face))
  "Highlighting expressions for OOC mode.")

;; set the syntax highlight
(defvar ooc-font-lock-keywords ooc-font-lock-keywords
  "Default highlighting expressions for OOC mode")

;; some basic indenting rules
(defun ooc-indent-line ()
  "Indent current line as OOC code."
  (interactive)
  (let ((cur-pos (point)) pos-in-line)
    ;; save the position of the cursor from the start of the text
    (beginning-of-line-text)
    (setq pos-in-line (- cur-pos (point)))
    ;; apply the indentation
    (beginning-of-line)
    (if (bobp)
        (indent-line-to 0)
      (let ((not-indented t) cur-indent)
        (if (looking-at "^[ \t]*}")
            (progn
              (save-excursion
                (forward-line -1)
                (setq cur-indent (- (current-indentation) default-tab-width)))
              (if (< cur-indent 0)
                  (setq cur-indent 0)))
          (save-excursion
            (while not-indented
              (forward-line -1)
              (if (looking-at "^[ \t]*}")
                  (progn
                    (setq cur-indent (current-indentation))
                    (setq not-indented nil))
                (if (looking-at ".*{")
                    (progn
                      (setq cur-indent (+ (current-indentation) default-tab-width))
                      (setq not-indented nil))
                  (if (bobp)
                      (setq not-indented nil)))))))
        (if cur-indent
            (indent-line-to cur-indent)
          (indent-line-to 0))))
    ;; restore the cursor position
    (forward-char pos-in-line)))
  
;; no special syntax table
(defvar ooc-mode-syntax-table nil
  "Syntax table for ooc-mode.")

;; create and activate syntax table
(defun ooc-create-syntax-table ()
  (if ooc-mode-syntax-table
      ()
    (setq ooc-mode-syntax-table (make-syntax-table))
    (set-syntax-table ooc-mode-syntax-table)
    ))

;; main
(defun ooc-mode ()
  "Major mode for editing OOC files."
  (interactive)
  (kill-all-local-variables)
  (ooc-create-syntax-table)
  (use-local-map ooc-mode-map)
  (make-local-variable 'font-lock-defaults)
  (setq font-lock-defaults '(ooc-font-lock-keywords 't))
  (make-local-variable 'indent-line-function)
  (setq indent-line-function 'ooc-indent-line)
  (setq major-mode 'ooc-mode)
  (setq mode-name "OOC")
  (setq imenu-generic-expression '((nil "^=head[1234] +\\(.*\\)" 1)))
  (run-hooks 'ooc-mode-hook)
  )

(provide 'ooc-mode)

;;; ooc-mode.el ends here
