(ns dailyprogrammer
  (:import (java.util Scanner)))


(defn get-century
  ""
  [n]
  (int (+ (Math/floor (/ n 100)) 1)))

(defn leap-year?
  ""
  [n]
  (if (not (= (mod n 4) 0))
    false
    (if (= (mod n 100) 0)
      (if (= (mod n 400) 0)
        true
        false)
      true)))

(def scan (Scanner. *in*))
(println "Enter a year")
(def year (Integer/parseInt (.nextLine scan)))
(println "Century: " (get-century year) "th")
(println "Leap year:" (leap-year? year))















