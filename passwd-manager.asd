(defsystem "passwd-manager"

  :depends-on (
               #:cl-fad
               )

  :components ((:module "src"
                :components
                ((:file "passwd-manager"))))

  :build-operation "program-op"
  :build-pathname "lisp-passwd"
  :entry-point "passwd-manager::main"

  )
