
;;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Base: 10 -*-

(defpackage bricks
  (:use :cl :asdf))

(in-package bricks)

(defsystem bricks
    :name "bricks"
    :version "0.0.1"
    :maintainer "ks"
    :author "ks"    
    :serial t
    :components (
		 (:file "variables")
		 (:file "sprite"
			:depends-on ("variables"))
		 (:file "screen"
			:depends-on ("variables" "sprite"))
		 (:file "ball"
			:depends-on ("variables" "sprite"))
                 (:file "main"
			:depends-on ("variables" "screen"))))
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

