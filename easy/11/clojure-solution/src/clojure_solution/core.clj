(ns clojure-solution.core
  (:gen-class))
(require '[clj-time.core :as t])

(import (java.util Scanner))
(def scan (Scanner. *in*))

(defn get-weekday
  "returns the weekday of a date"
  [date]
  (def weekdays {:1 "monday" 2 "tuesday" :3 "wednesday" :4 "thursday" :5 "friday" :6 "saturday" :7 "sunday"})
  (println "the weekday is: ")
  (println (get weekdays (t/day-of-week date))))

(defn -main
  "project entry-point"
  [& args]
  (println "enter day")
  (def d (.nextLine scan))
  (println "enter month")
  (def m (.nextLine scan))
  (println "enter year")
  (def y (.nextLine scan))
  (get-weekday (t/date-time (read-string y) (read-string m) (read-string d))))

;(-main)

