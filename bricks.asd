
;;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Base: 10 -*-

(defpackage #:bricks-asd
  (:use :cl :asdf))

(in-package :bricks-asd)

(defsystem bricks
    :name "bricks"
    :version "0.0.1"
    :maintainer "ks"
    :author "ks"    
    :serial t
    :components (
                 (:file "main")
;		 (:file "parameters")
;		 (:file "pictures"
;			:depends-on ("parameters"))
;		 (:file "setup"
;			:depends-on ("parameters" "pictures"))
;		 (:file "ball"
;			:depends-on ("parameters"))
;		 (:file "paddle"
;			:depends-on ("parameters"))
;		 (:file "main"
;			:depends-on ("parameters" "setup"  "ball" "paddle"))))
))
