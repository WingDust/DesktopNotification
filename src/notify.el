(defun getorg()
  ""
  (interactive)
  (let (foo)
    ;;(goto-line 1)
    (save-excursion
      (while (re-search-forward "SCHEDULED" nil t)
        (setq otitle (org-entry-get (point) "SCHEDULED"))
        (setq obody (nth 4 (org-heading-components)))
        (setq odate ((nth 0 (split-string (string-trim-right otitle ">")))))
        (setq otime ((nth 2 (split-string (string-trim-right otitle ">")))))


        ;; send the notification
        (if (equal (format-time-string "%4Y-%2m-%2d" (current-time)) odate)

          (setq alert-id (w32-notification-notify  :title otime
                                                   :body obody ))

          (when alert-id (w32-notification-close alert-id)))

        ;;(org-get-heading t t)
        ;;(org-get-entry)
        ;;(org-up-heading-all)
        ;;(org-up-heading-safe)
        ;;(org-get-heading)
        ))))


(current-time-string)
(current-time)
(seconds-to-time 86400)
(format-time-string "%4Y-%2m-%2d" (time-add (current-time) ))
(equal (format-time-string "%4Y-%2m-%2d"  (current-time)) "2020-07-30")

(defun test1 () 
  (message "1"))

(run-at-time "1:48am" nil #'test1)

(current-time-string)

(let (x) 
  (setq x '(("mary" . 1) 
            ("mary" . 2)))
  ;;(dolist x
  (message (number-to-string (cdr (assoc "mary" x))))
  ;;  )
  )