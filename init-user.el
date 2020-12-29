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

;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
(setq lsp-keymap-prefix "C-l")

(use-package lsp-mode
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (ruby-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)
;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
;;(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

(use-package vterm
  :config
  (define-key vterm-mode-map [remap previous-line] 'vterm--self-insert)
  (define-key vterm-mode-map [remap next-line] 'vterm--self-insert)
  (define-key vterm-mode-map [remap left-char] 'vterm--self-insert)
  (define-key vterm-mode-map [remap right-char] 'vterm--self-insert)
  (define-key vterm-mode-map [remap backward-word] 'vterm--self-insert)
  (define-key vterm-mode-map [remap forward-word] 'vterm--self-insert)
  (define-key vterm-mode-map [remap move-beginning-of-line] 'vterm--self-insert)
  (define-key vterm-mode-map [remap move-end-of-line] 'vterm--self-insert)
  (define-key vterm-mode-map [remap backward-kill-word] 'vterm--self-insert)
  (define-key vterm-mode-map [remap kill-word] 'vterm--self-insert)
  (define-key vterm-mode-map [remap delete-backward-char] 'vterm--self-insert)
  (define-key vterm-mode-map [remap delete-char] 'vterm--self-insert)
  (define-key vterm-mode-map [remap wakib-backward-kill-line] 'vterm--self-insert)
  (define-key vterm-mode-map [remap kill-line] 'vterm--self-insert))

(use-package smart-tabs-mode
  )

(provide 'init-user)
