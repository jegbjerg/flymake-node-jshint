# flymake-node-jshint

Emacs library providing simple flymake for JavaScript using JSHint
through node-jshint.

Inspired by:

* [https://github.com/daleharvey/jshint-mode]
* [http://www.emacswiki.org/emacs/FlymakeJavaScript]
* [http://lapin-bleu.net/riviera/?p=191]

## Dependencies

* node-jshint

Install with npm: `npm install -g jshint`.

## Example Emacs setup

    (require 'flymake-node-jshint)
    (setq flymake-node-jshint-config "~/.jshintrc-node.json") ; optional
    (add-hook 'js-mode-hook (lambda () (flymake-mode 1)))
