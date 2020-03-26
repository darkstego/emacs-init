;; Place all local configuration options here

;; Automatically create closing parenthesis/quote
(electric-pair-mode 1)

;; Auto-save org-mode buffers
(add-hook 'auto-save-hook 'save-my-org-buffers)
(defun save-my-org-buffers()
  (interactive)
  (save-some-buffers t (lambda ()
			 (and buffer-file-name
			      (eq major-mode 'org-mode)
			      (string= (expand-file-name "./")
				  (expand-file-name "~/Dropbox/org/"))))))


(use-package visual-fill-column
  :config
  (add-hook 'visual-line-mode-hook #'visual-fill-column-mode))

(setq org-agenda-files (list "~/Dropbox/org/todo.org"))

(use-package keychain-environment
  :config
  (keychain-refresh-environment))

(use-package omnisharp
  :config
  (add-hook 'csharp-mode-hook 'omnisharp-mode)
  (eval-after-load
      'company
    '(add-to-list 'company-backends 'company-omnisharp)))

;; Mouse wheel tilt left/right
(setq mouse-wheel-tilt-scroll t)
(setq mouse-wheel-flip-direction t)

(provide 'init-user)
