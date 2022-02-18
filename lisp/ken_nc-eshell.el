;;; https://www.emacswiki.org/emacs/EshellFunctions

;;; Inspire by http://blog.binchen.org/posts/use-ivy-mode-to-search-bash-history.html
(defun ken_nc/parse-bash-history ()
  "Parse the bash history."
  (interactive)
  (let (collection bash_history)
    (shell-command "history -r") ; reload history
    (setq collection
          (nreverse
           (split-string (with-temp-buffer (insert-file-contents (file-truename "~/.bash_history"))
                                           (buffer-string))
                         "\n"
                         t)))
    (when (and collection (> (length collection) 0)
               (setq bash_history collection))
      bash_history)))

(defun ken_nc/esh-history ()
  "Interactive search eshell history."
  (interactive)
  (require 'em-hist)
  (save-excursion
    (let* ((start-pos (eshell-beginning-of-input))
		   (input (eshell-get-old-input))
		   (esh-history (when (> (ring-size eshell-history-ring) 0)
						  (ring-elements eshell-history-ring)))
		   (all-shell-history (append esh-history (ken_nc/parse-bash-history))))
      (let* ((def (car all-shell-history))
			 (command (completing-read
					   (format "Choose from history [%s]: " def)
					   all-shell-history nil nil nil nil def nil)))
		(eshell-kill-input)
		(insert command))))
  ;; move cursor to eol
  (end-of-line))


(defun ken_nc/eshell-clear-buffer ()
  "Clear terminal."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))

(use-package eshell
  :commands eshell
  :init (progn
		  (setq
		   eshell-highlight-prompt nil
		   eshell-buffer-shorthand t
		   eshell-history-size 5000
		   ;; auto truncate after 12k lines
		   eshell-buffer-maximum-lines 12000
		   eshell-hist-ignoredups t
		   eshell-error-if-no-glob t
		   eshell-glob-case-insensitive t
		   eshell-scroll-to-bottom-on-input 'all
		   eshell-list-files-after-cd t
		   eshell-aliases-file (concat user-emacs-directory "eshell/alias")
		   eshell-banner-message "(´ー`)y-~~ (´ー`)y-~~ (´ー`)y-~~ (´ー`)y-~~\n\n"
		   ;; eshell-banner-message "What would you like to do?\n\n"
		   )
		  ;; Visual commands
		  (setq eshell-visual-commands '("vi" "screen" "top" "less" "more" "lynx"
										 "ncftp" "pine" "tin" "trn" "elm" "vim"
										 "nmtui" "alsamixer" "htop" "el" "elinks"
										 ))
		  (setq eshell-visual-subcommands '(("git" "log" "diff" "show")))

		  )
  :bind
  (("C-r" . ken_nc/esh-history)
   ("C-l" . ken_nc/eshell-clear-buffer)))

(message "loading init-eshell")
(provide 'init-eshell)
;;; init-eshell.el ends here
