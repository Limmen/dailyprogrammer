(ns dailyprogrammer
  (:require [clojure.core.reducers :as r]))

(defn get-number [day month]
  (+ (r/fold + (take (- month 1) '(31 28 31 30 31 30 31 31 30 31 30))) day))

(println "Enter day")
(def day (read-line))
(println "Enter month")
(def month (read-line))
(println "The number of the year is: " (get-number (read-string day) (read-string month)))
