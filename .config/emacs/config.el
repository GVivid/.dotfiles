;; This makes it so emacs knows where to look for files.
(use-package exec-path-from-shell
  :ensure t)
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (setq exec-path-from-shell-variables '("PATH" "MANPATH" "MAGICK_HOME" "DYLD_LIBRARY_PATH"))
  (exec-path-from-shell-initialize))
(exec-path-from-shell-initialize)
(setq custom-file "custom-vars.el")    ;; Specify the custom file path.
(load custom-file 'noerror 'nomessage) ;; Load the custom file quietly, ignoring errors.

(setq org-directory "~/Documents/Org")

(use-package org
  :ensure nil     ;; This is built-in, no need to fetch it.
  :defer t)       ;; Defer loading Org-mode until it's needed.

;;; Ensure org mode is loaded
(require 'org)

;; This tells emacs where to reference files for org-agenda.
(setq org-agenda-files (file-expand-wildcards (concat org-directory "/*.org")))

(global-set-key (kbd "C-S-o") 'org-agenda)

;;; Set the default file for general notes/captures
(setq org-default-notes-file (concat org-directory "/Ideas.org"))

(message (concat org-directory "/Inbox.org"))


;; Capture templates
;; I had an error here where I was concatenating the org-directory to
;; the file, but if you do not specify an absolute path, all
;; paths are relative to the org-directory path
(setq org-capture-templates
      '(("t" "Todo" entry
         (file+headline "Inbox.org" "Inbox")
         "** TODO %^{Task}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?")

        ("f" "Fleeting" entry
         (file+headline "Ideas.org" "Fleeting")
         "** IDEA %^{Idea}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?")

        ("d" "Deadline" entry
         (file+headline "Calendar.org" "Deadlines")
         "** TODO %^{task}\ndeadline: %^{deadline}t\n:properties:\n:created: %u\n:captured: %a\n:end:\n%?")

        ("p" "Project" entry
         (file+headline "Projects.org" "Projects")
         "* PROJ %^{Project name}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n** TODO %?")

        ("i" "Idea" entry
         (file+headline "Ideas.org" "Ideas")
         "** IDEA %^{Idea}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?")

        ))

(global-set-key (kbd "C-S-c") 'org-capture)

;; This sets the files that refile can refile into. Maxlevel sets the number of subheadings refile can take.
(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))

(setq org-roam-capture-templates
        '(("d" "default" plain "%?" :target
           (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n:PROPERTIES:\n:CREATED: %U\n:END:\n")
           :unnarrowed t)
  
          ("l" "Literature" plain "%?"  :if-new
           (file+head "Literature/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n:PROPERTIES:\n:CREATED: %U\n:END:\n")
           :unnarrowed t)))
  

    ;; Modified from here: https://systemcrafters.net/build-a-second-brain-in-emacs/keep-a-journal/
    (use-package org-roam
      :ensure t
      :init
      (setq org-roam-v2-ack t)
      :custom
      (org-roam-directory (concat org-directory "/roam"))
      (org-roam-completion-everywhere t)
      (org-roam-dailies-capture-templates
        '(("d" "default" entry ""
           :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n:PROPERTIES:\n:CREATED: %U\n:END:\n"
                              ))))
:bind (("C-c n l" . org-roam-buffer-toggle)
       ("C-c n f" . org-roam-node-find)
       ("C-c n i" . org-roam-node-insert)
       :map org-mode-map
       ("C-M-i" . completion-at-point)
       :map org-roam-dailies-map
       ("Y" . org-roam-dailies-capture-yesterday)
       ("T" . org-roam-dailies-capture-tomorrow))
:bind-keymap
("C-c n d" . org-roam-dailies-map)
      :config
      (require 'org-roam-dailies) ;; Ensure the keymap is available
      (org-roam-db-autosync-mode))

(global-set-key (kbd "C-;") 'org-roam-dailies-goto-today)

;; This just sets where the images are stored for LaTeX.
(setq org-preview-latex-image-directory "~/Documents/ltximg/")
(add-to-list 'org-preview-latex-process-alist
             '(tectonic :programs ("tectonic" "convert")
                        :description "pdf > png"
                        :message "Ensure tectonic and imagemagick are installed."
                        :image-input-type "pdf"
                        :image-output-type "png"
                        :image-size-adjust (1.0 . 1.0)
                        :latex-compiler
                        ("tectonic -Z shell-escape-cwd=%o --outfmt pdf --outdir %o %F")
                        :image-converter
                        ("convert -density 192 -trim -background white -alpha remove %F %O")
                        :transparent-image-converter
                        ("convert -density 192 -trim -background none %F %O")))

(setq org-preview-latex-default-process 'tectonic)

;; set up babel support
(use-package org-babel)
(use-package org-babel-init)
(use-package org-babel-gnuplot)
(use-package gnuplot)
;; add additional languages with (require 'org-babel-language)
;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((gnuplot . t)))

;; I want to store all my gnuplot babel outputs in one folder for easier deletion, and this function intercepts my gnuplot babel and adds my preferred directory to the file path.
(defun my/org-babel-gnuplot-path-fix (info)
  "Intercept babel info to prepend the directory to the :file argument."
  (let* ((lang (nth 0 info)) ;; Set lang = first argument of babel heading, aka, the language in the block.
         (params (nth 2 info)) 
         (file-assoc (assoc :file params))
         (output-dir "~/Documents/org-babel-output/"))
    
    (when (and (string= lang "gnuplot") file-assoc)
      ;; 1. Ensure the directory exists
      (unless (file-exists-p output-dir)
        (make-directory output-dir t))
      
      ;; 2. Update the path in the params list
      ;; We use expand-file-name to handle the '~' correctly for the OS
      (let ((filename (cdr file-assoc)))
        (unless (string-prefix-p output-dir (expand-file-name filename))
          (setcdr file-assoc (concat output-dir filename)))))
    info))

;; Use the 'org-babel-get-src-block-info' filter to modify parameters on the fly
(advice-add 'org-babel-get-src-block-info :filter-return #'my/org-babel-gnuplot-path-fix)

;; Standard auto-refresh for inline images
;; (add-hook 'org-babel-after-execute-hook 'org-display-inline-images)

;; This just maximizes the window.
(toggle-frame-maximized)

;; This makes it so text wraps globally.
(global-visual-line-mode)
