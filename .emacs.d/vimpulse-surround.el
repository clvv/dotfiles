;;; vimpulse-surround.el --- emulate surround.vim in Vimpulse

;; Copyright (C) 2010 Tim Harper
;;
;; Author: Tim Harper
;; Maintainer: Tim Harper <timcharper at gmail dat com>
;;      Please send bug reports to the mailing list (see below).
;; Created: July 23 2010
;; Version: 0.1+git
;; Keywords: emulations, viper
;; Human-Keywords: vim, visual-mode, surround.vim
;; Mailing list: <implementations-list at lists.ourproject.org>
;;      Subscribe: http://tinyurl.com/implementations-list
;;      Newsgroup: nntp://news.gmane.org/gmane.emacs.vim-emulation
;;      Archives: http://dir.gmane.org/gmane.emacs.vim-emulation
;; Related: viper.el, vimpulse.el, viper-in-more-modes.el
;;
;; This file is not part of GNU Emacs.

;;; Commentary:

;; `vimpulse-surround' emulates surround.vim, a popular Vim plugin.
;;
;; Requires a recent Vimpulse version. More information on Vimpulse and how to
;; get it can be found here:

;; http://www.assembla.com/spaces/vimpulse

;; Tested with GNU Emacs 23.2

;;; Code:

(require 'vimpulse)

(defgroup vimpulse-surround nil
  "surround.vim in Emacs"
  :prefix "vimpulse-surround-"
  :group 'vimpulse)

(defcustom vimpulse-surround-pairs
  '((")" . ("(" . ")"))
    ("(" . ("( " . " )"))
    ("]" . ("[" . "]"))
    ("[" . ("[ " . " ]"))
    ("}" . ("{" . "}"))
    ("{" . ("{ " . " }"))
    ("#" . ("#{" . "}"))
    ("t" . 'vimpulse-surround-read-tag)
    ("<" . 'vimpulse-surround-read-tag))
  "Alist of surround items.
Each item is of the form (TRIGGER . (LEFT . RIGHT)), all strings.
This only affects inserting pairs, not deleting or changing them."
  :group 'vimpulse-surround
  :type '(repeat (cons (regexp :tag "Key")
                       (symbol :tag "Surround pair"))))

(defun vimpulse-surround-char-to-pair (char)
  (let ((pairs (or (vimpulse-unquote (assoc-default char vimpulse-surround-pairs))
                   (cons char char))))
    (if (symbolp pairs)
        (funcall pairs)
      pairs)))

(defvar *vimpulse-surrounding* nil
  "Internal variable set by `vimpulse-surround-define-text-object'.
It triggers `vimpulse-change'. Nothing to see here, move along.")

(defvar *vimpulse-surround-start-size* nil)
(defvar *vimpulse-surround-end-size* nil)

(defvar vimpulse-surround-read-tag-keymap
  (let ((map (copy-keymap minibuffer-local-map)))
    (define-key map ">" 'exit-minibuffer)
    map))

(defun vimpulse-surround-read-tag ()
  (let* ((input (read-from-minibuffer "<" "" vimpulse-surround-read-tag-keymap))
         (_ (string-match "\\([a-z-]+\\)\\(.*?\\)[>]*$" input))
         (tag  (match-string 1 input))
         (rest (match-string 2 input)))
    (cons (format "<%s%s>" tag rest) (format "</%s>" tag))))

(defun vimpulse-surround-region (start end)
  "Surround selection with input."
  (interactive "r")
  (let (pair)
    (setq pair (vimpulse-surround-char-to-pair
                (format "%c" (viper-read-char-exclusive))))
    (goto-char end)
    (insert (cdr pair))
    (goto-char start)
    (insert (car pair))
    (goto-char start)))

(defun vimpulse-surround-prepend-key-prefix (keys)
  (mapcar (lambda (key) (concat "s" key)) keys))

(defmacro vimpulse-surround-define-text-object (object args &rest body)
  (let (forward-args
        strip-keys
        (strip-object-name (intern (concat (symbol-name object) "-strip")))
        keys
        (docstring (pop body)))
    (while (keywordp (car body))
      (setq keyword (pop body))
      (cond
       ((eq keyword :keys)
        (setq keys (vimpulse-surround-prepend-key-prefix
                    (vimpulse-unquote (pop body)))))
       ((eq keyword :strip-keys)
        (setq strip-keys (vimpulse-surround-prepend-key-prefix
                          (vimpulse-unquote (pop body)))))
       (t
        (push (pop body) forward-args)
        (push keyword forward-args))))

    (setq output '(progn))
    (when keys
      (nconc output `((vimpulse-define-text-object ,object ,args
                        ,docstring
                        ,@forward-args
                        :keys ',keys
                        (setq *vimpulse-surrounding* t)
                        ,@body))))
    (when strip-keys
      (nconc output `((vimpulse-define-text-object ,strip-object-name ,args
                        ,docstring
                        ,@forward-args
                        :keys ',strip-keys
                        (setq *vimpulse-surrounding* 'strip)
                        ,@body))))
    output))

(defun vimpulse-surround-zap-whitespace (direction boundary)
  (let ((pred (if (= direction 1)
		  'looking-at
		'looking-back)))
    (while (and (funcall pred "[ \t]") (not (= (point) boundary)))
      (delete-char direction)
      (when (= direction 1) (setq boundary (1- boundary))))))

(defun vimpulse-surround-delete (begin end strip)
  "Delete the surrounding characters in the range BEGIN END.
If STRIP is non-nil, eliminate all whitespace surrounding the range."
  (let ((o (make-overlay begin end)))
    (goto-char (overlay-start o)) (delete-char 1)
    (goto-char (overlay-end o)) (delete-char -1)
    (when strip
      (vimpulse-surround-zap-whitespace -1 (overlay-start o))
      (goto-char (overlay-start o))
      (vimpulse-surround-zap-whitespace 1 (overlay-end o)))
    (goto-char (overlay-start o))
    (delete-overlay o)))

(defun vimpulse-surround-change (begin end strip)
  "Replace items surrounding the range BEGIN END for new ones.
See `vimpulse-surround-delete' for the meaning of the STRIP argument."
  (let ((o (make-overlay begin end)))
    (vimpulse-surround-delete begin end strip)
    (vimpulse-surround-region (overlay-start o) (overlay-end o))
    (delete-overlay o)))

(defun vimpulse-delete-surround-or-delete (&optional beg end dont-save)
  "Dispatcher replacement for `vimpulse-delete'.
Prompt for a range. If the range returned is detected to be a surround
range, dispatch to `vimpulse-surround-delete'.
Otherwise, dispatch to `vimpulse-delete'."
  (interactive)
  (let (*vimpulse-surrounding*)
    (when (not beg) (let ((range (vimpulse-range)))
                      (setq beg (car range)
                            end (cadr range))))
    (if *vimpulse-surrounding*
        (vimpulse-surround-delete beg end (eq *vimpulse-surrounding* 'strip))
      (vimpulse-delete beg end dont-save))))

(defun vimpulse-change-surround-or-change (&optional beg end dont-save)
  "Dispatcher replacement for `vimpulse-change'.
Prompt for a range. If the range returned is detected to be a surround
range, dispatch to `vimpulse-surround-change'.
Otherwise, dispatch to `vimpulse-change'."
  (interactive)
  (let (*vimpulse-surrounding*)
    (when (not beg) (let ((range (vimpulse-range)))
                      (setq beg (car range)
                            end (cadr range))))
    (if *vimpulse-surrounding*
        (vimpulse-surround-change beg end (eq *vimpulse-surrounding* 'strip))
      (vimpulse-change beg end dont-save))))

(define-key viper-vi-basic-map "d" 'vimpulse-delete-surround-or-delete)
(define-key viper-vi-basic-map "c" 'vimpulse-change-surround-or-change)

(define-key vimpulse-visual-basic-map "s" 'vimpulse-surround-region)

(vimpulse-surround-define-text-object vimpulse-surround-paren (arg)
  "Select surrounding parentheses."
  :keys '("b" ")")
  :strip-keys '("(")
  (vimpulse-paren-range arg ?\( nil t))

(vimpulse-surround-define-text-object vimpulse-surround-bracket (arg)
  "Select surrounding brackets."
  :keys '("]")
  :strip-keys '("[")
  (vimpulse-paren-range arg ?\[ nil t))

(vimpulse-surround-define-text-object vimpulse-surround-brace (arg)
  "Select surrounding curly braces."
  :keys '("}")
  :strip-keys '("{")
  (vimpulse-paren-range arg ?\{ nil t))

(vimpulse-surround-define-text-object vimpulse-surround-angle (arg)
  "Select surrounding curly braces."
  :keys '(">")
  :strip-keys '("<")
  (vimpulse-paren-range arg ?< nil t))

(vimpulse-surround-define-text-object vimpulse-surround-single-quote (arg)
  "Select a single-quoted expression."
  :keys '("'")
  (vimpulse-quote-range arg ?' t))

(vimpulse-surround-define-text-object vimpulse-surround-double-quote (arg)
  "Select a double-quoted expression."
  :keys '("\"")
  (vimpulse-quote-range arg ?\" t))

(provide 'vimpulse-surround)
;;; vimpulse-surround.el ends here
