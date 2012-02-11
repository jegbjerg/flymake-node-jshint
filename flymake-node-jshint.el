;; flymake-node-jshint.el -- simple flymake for JavaScript using JSHint through node-jshint

;; Author: Henrik Jegbjerg Hansen <hjh@freecode.dk>
;; 
;; Released under the simplified BSD license, see LICENSE for details.

;;; Commentary;
;; 
;; Inspired by:
;; - https://github.com/daleharvey/jshint-mode
;; - http://www.emacswiki.org/emacs/FlymakeJavaScript
;; - http://lapin-bleu.net/riviera/?p=191

;;; Usage: 
;; 
;; Install jshint:
;; 
;; npm install -g jshint
;;
;; Setup Emacs:
;;
;; (require 'flymake-node-jshint)
;; (setq flymake-node-jshint-config "~/.jshintrc-node.json") ; optional
;; (add-hook 'js-mode-hook (lambda () (flymake-mode 1)))


(require 'flymake)

(defcustom flymake-node-jshint-program "jshint"
  "The JSHint program name."
  :type 'string
  :group 'flymake-node-jshint)

(defcustom flymake-node-jshint-config nil
  "If non-nil, specifies the location of the JSHint configuration file to use."
  :type 'string
  :group 'flymake-node-jshint)

(defun flymake-jshint-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name)))
         (arglist (list local-file)))
    (if flymake-node-jshint-config
        (setq arglist (append arglist (list "--config" (expand-file-name flymake-node-jshint-config)))))
    (list flymake-node-jshint-program arglist)))

(setq flymake-err-line-patterns
      (cons '(".*: line \\([[:digit:]]+\\), col \\([[:digit:]]+\\), \\(.*\\)$"
              nil 1 2 3)
            flymake-err-line-patterns))

(add-to-list 'flymake-allowed-file-name-masks
             '("\\.js\\'" flymake-jshint-init)
             '("\\.json\\'" flymake-jshint-init))

(provide 'flymake-node-jshint)
