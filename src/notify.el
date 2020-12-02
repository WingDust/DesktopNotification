(defun get-org()
  "对一个Org 文件中设有"
  (interactive)
  (let (foo)
    (goto-line 1) ;; 到第一行去
    (save-excursion
      (while (re-search-forward "SCHEDULED" nil t) ;; 会从光标当前行开始正则匹配 SCHEDULED
        ;; <2020-11-19 周四 13:04>
        (setq otitle (org-entry-get (point) "SCHEDULED"))
        ;; 工作
        (setq obody (nth 4 (org-heading-components)))
        ;; TODO keyword
        (setq okeyword (nth 2 (org-heading-components)))
        (setq odate (nth 0 (split-string (string-trim otitle "<" ">"))))
        (setq otime (nth 2 (split-string (string-trim otitle "<" ">"))))
        (unless (equal (format-time-string "%4Y-%2m-%2d" (current-time)) odate) ;; 只有当它的日期与当前计算机日期在同一天才会发出
            (error "日期不在这一天")
            )
        ;; 分解时间字符串来完成时间加减
        (setq num1 (string-to-number (nth 0 (split-string otime ":"))))
        (setq num2 (nth 1 (split-string otime  ":")))
        ;; send the notification
        (if (string-equal "00" num2)
            (if (string-equal "00" (number-to-string num1))
                (setq otime2 "23:59")
              (progn
                (setq num1 (number-to-string (- num1 1)))
                (setq otime2 (concat num1 ":" "59"))
                )
              )
          (setq otime2 (concat (number-to-string num1) ":"  (number-to-string (- (string-to-number num2) 1))))
          )

            (run-at-time otime2 nil (lambda ()
                                      (f-write-text (concat okeyword "\n" obody) 'utf-8
                                                    "E:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\notify\\Record.txt")
                                      ))

            (run-at-time otime nil (lambda ()
                                     ;;(setq alert-id (w32-notification-notify  :title otime :body obody ))
                                     ;;(when alert-id (w32-notification-close alert-id)))
                                     (w32-shell-execute "open"  "E:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\notify\\notify.exe")))
          ))))













(w32-shell-execute "open"  "E:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\notify\\notify.exe" 0)


(f-write-text (concat "asd" "\n" "asd1") 'utf-8
              ;;     "E:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\notify\\Record.txt")
              "D:\\Record.txt")

(file-writable-p "D:\\Record.txt")


(if 1
(if 1
  ;;(insert "1")
  ;;(if 1
  ;;    (insert "2")
  ;;    )
  ;;  )
(progn
  (insert "3")
  (insert "3")
  )
)




;;(format-seconds  (parse-time-string "17:15"))
;;(encode-time (parse-time-string "17:15"))
;;
;;(encode-time )
;;(format-time-string (parse-time-string "17:15"))
;;(time-to-seconds "17:15")
;;(parse-time-string "17:15")
;;
;;(decode-time)
;;(date-to-time "17:15")
;;
;;
;;
;;(w32-shell-execute "runas"  "E:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\notify\\notify.exe"
;;                   ;;(concat "TODOs (format "%S" "a sd")))
;;                   (concat "TODO" " " (format "%S" "工作")))
;;
;;(start-process-shell-command)
;;(start-process)
;;
;;
;;(f-write-text "工作\n我人" 'utf-8
;;              "E:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\notify\\Record.txt")
;;(w32-shell-execute "open"
;;         "E:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\notify\\notify.exe")
;;
;;
;;
;;
;;(nth 2 (split-string (string-trim-right "<2020-07-30 周四 22:00>" "<>")))
;;(string-trim "<2020-07-30 周四 22:00>" "<" ">")
;;(funcall (lambda () (- 2 1)))
;;
;;
;;(current-time-string)
;;(current-time)
;;(seconds-to-time 86400)
;;(format-time-string "%4Y-%2m-%2d" (time-add (current-time) ))
;;(equal (format-time-string "%4Y-%2m-%2d"  (current-time)) "2020-07-30")
;;
;;
;;(run-at-time "18:12" nil #'test1)
;;
;;(current-time-string)
;;
;;(let (x) 
;;  (setq x '(("mary" . 1) 
;;            ("mary" . 2)))
;;  ;;(dolist x
;;  (message (number-to-string (cdr (assoc "mary" x))))
;;  ;;  )
;;  )


;;(org-get-heading t t)
;;(org-get-entry)
;;(org-up-heading-all)
;;(org-up-heading-safe)
;;(org-get-heading)
