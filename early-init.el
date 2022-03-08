;; This file is loaded before the package system and GUI is initialized, so in
;; it you can customize variables that affect frame appearance as well as the
;; package initialization process, such as package-enable-at-startup,
;; package-load-list, and package-user-dir. Note that variables like
;; package-archives which only affect the installation of new packages, and not
;; the process of making already-installed packages available, may be customized
;; in the regular init file.

(defvar startup/file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(defun startup/revert-file-name-handler-alist ()
  (setq file-name-handler-alist startup/file-name-handler-alist))

(defun startup/reset-gc ()
  (setq gc-cons-threshold 100000000))

(setq read-process-output-max (* 2048 2048)) ;; 1mb

(add-hook 'emacs-startup-hook 'startup/revert-file-name-handler-alist)
(add-hook 'emacs-startup-hook 'startup/reset-gc)

(abbrev-mode -1)

(setq
 warning-minimum-level :emergency
 auto-save-default nil
 make-backup-file nil
 load-prefer-newer t
 mode-line-format nil
 package-enable-at-startup nil
 package-native-compile t)

(provide 'early-init)
