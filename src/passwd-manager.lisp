(defpackage #:passwd-manager
  (:use :cl))

(in-package #:passwd-manager)

(ql:quickload :cl-fad)

(defun create-passwd ()

  (format t "Programme name: ~&")
  (defvar programme-name)
  (defvar programme-password)
  (setf programme-name (read))


  (cond

    ((cl-fad:file-exists-p (format nil "./~a/" programme-name)) (format t "It already exists. ~&"))


    (t (with-open-file (stream (format nil "./~a" programme-name) :if-exists :append :direction :output :if-does-not-exist :create)
         (format t "Enter the passwd:~&")
         (setf programme-password (read))
         (format stream "~a ~&" (string-downcase programme-password))
         ))

    )
)

(defun see-passwd ()

  (format t "Programme name: ~&")
  (defvar programme-name)
  (setf programme-name (read))

  (cond
    ((cl-fad:file-exists-p (format nil "./~a/" programme-name))
     (with-open-file (stream (format nil "./~a/" programme-name) :if-does-not-exist nil)
       (loop for line = (read-line stream nil)
             while line do (format t "Passwd: ~a" line)
             )
       )
     )
    )

)

(defun del-passwd ()

  (format t "Programme name: ~&")
  (defvar programme-name)
  (setf programme-name (read))

  (cond
    ((cl-fad:file-exists-p (format nil "./~a/" programme-name))
     (uiop:delete-file-if-exists (format nil "./~a/" programme-name))
     )
    )

)

(defun menu ()

  (format t "1. Create entry~&2. See the password~&3. Delete the password~&")

  (format t "Choose an option:~&")

  (defvar option (make-array '(0) :element-type 'base-char :adjustable t))
  (setf option (read-line))

(cond

    ((= 1 (parse-integer option)) (create-passwd))
    ((= 2 (parse-integer option)) (see-passwd))
    ((= 3 (parse-integer option)) (del-passwd))

    (t (format t "There's no such option. ~&"))
    )


  )

(defun main ()
  (menu)
  )
