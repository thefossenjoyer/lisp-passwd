(pushnew (uiop::getcwd) ql:*local-project-directories*)
(ql:quickload :passwd-manager)
(ql:quickload :cl-fad)
(asdf:make :passwd-manager)
