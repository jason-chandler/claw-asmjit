(in-package :claw-asmjit)

(cffi:load-foreign-library "/home/jason/common-lisp/libresect.so")

  (claw:defwrapper (:aw-asmjit
                    (:system :claw-asmjit/wrapper)
                    (:headers "asmjit.h")
                    (:includes :asmjit-includes)
                    (:targets ((:and :x86-64 :linux) "x86_64-pc-linux-gnu")
                              ((:and :x86-64 :windows) "x86_64-pc-windows-gnu"))
                    (:persistent :asmjit-bindings
                     :depends-on (:claw-utils)
                     :asd-path "/home/jason/common-lisp/claw-asmjit/src/asmjit-bindings.asd"
                     :bindings-path "/home/jason/common-lisp/claw-asmjit/src/bindings/")
                    (:language :c++)
                    (:standard :c++17)
                    (:include-definitions "^asmjit::.*"))
    :in-package :%aw-asmjit
    :trim-enum-prefix t
    :recognize-bitfields t
    :recognize-strings t
    :with-adapter (:static
                   :path "lib/adapter.cxx")
    :symbolicate-names (:in-pipeline
                        (:by-removing-prefixes "ASMJIT_"))
    :override-types ((:string claw-utils:claw-string)
                     (:pointer claw-utils:claw-pointer)
                     ))

(defun generate-and-load-wrapper ()
    (claw:generate-wrapper :aw-asmjit)
    (claw:load-wrapper :aw-asmjit))

(defun load-wrapper ()
  (claw:load-wrapper :aw-asmjit))
