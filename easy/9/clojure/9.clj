(ns dailyprogrammer)
(import '(java.util Scanner))
(def scan (Scanner. *in*))

(println "Enter numbers separated by spaces")
(def numbers (.nextLine scan))
(sort (map read-string (clojure.string/split numbers #" ")))

