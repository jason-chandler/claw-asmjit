;;;; claw-asmjit.asd

(asdf:defsystem :claw-asmjit/wrapper
  :description "asmjit bindings"
  :author "Jason Chandler"
  :license "MIT"
  :version "1.0"
  :depends-on (:cffi :claw :claw-utils :cl-resect :cl-ppcre :uiop)
  :pathname "src/"
  :serial t
  :components (
               (:module :asmjit-includes :pathname "asmjit/src/asmjit/")))



(asdf:defsystem #:claw-asmjit
  :description "Describe claw-asmjit here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :depends-on (:claw-asmjit/wrapper)
  :pathname "src/"
  :serial t
  :components ((:file "package")
               (:file "claw")))
