(ns dailyprogrammer)
(import (java.util Scanner))

;*varname* is used to denote special vars. 
;Usually ** is used to denote dynamic vars.
(def scan (Scanner. *in*))

(println "Enter username")
(def username (.nextLine scan))
(println "Enter password")
(def pw (.nextLine scan))

;Syntax for calling static methods:
;Classname/methodName arguments
(def auth (hash-map :username (nth (clojure.string/split-lines (slurp "auth.txt")) 0)  :password (nth (clojure.string/split-lines (slurp "auth.txt")) 1)))

(if (and (= (get auth :password) pw) (= (get auth :username) username))
    (println "Välkommen in i värmen! \n you entered the correct password combination")
    (println "Wrong password combination"))

