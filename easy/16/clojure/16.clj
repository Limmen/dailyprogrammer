(ns dailyprogrammer)

(println "Enter first string")
(def str1 (read-line))
(println "Enter second string")
(def str2 (read-line))

(apply str (filter #(not (.contains str2 (str %1))) (seq str1)))
