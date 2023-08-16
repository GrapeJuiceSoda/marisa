;;; nav-flash-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from nav-flash.el

(let ((loads (get 'nav-flash 'custom-loads))) (if (member '"nav-flash" loads) nil (put 'nav-flash 'custom-loads (cons '"nav-flash" loads)) (put 'navigation 'custom-loads (cons 'nav-flash (get 'navigation 'custom-loads)))))
(autoload 'nav-flash-show "nav-flash" "\
Flash a temporary highlight to help the user find something.

POS is optional, and defaults to the current point.

If optional END-POS is set, flash the characters between the two
points, otherwise flash the entire line in which POS is found.

The flash is normally not inclusive of END-POS.  However, when
POS is equal to END-POS, the single character at POS will flash.

Optional FACE defaults to `nav-flash-face'.  Optional DELAY
defaults to `nav-flash-delay' seconds.  Setting DELAY to 0 makes
this function a no-op.

(fn &optional POS END-POS FACE DELAY)")
(register-definition-prefixes "nav-flash" '("nav-flash-"))

;;; End of scraped data

(provide 'nav-flash-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; nav-flash-autoloads.el ends here
