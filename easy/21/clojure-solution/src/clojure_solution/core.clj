(ns clojure-solution.core
  (:gen-class)
  (:require [clojure.math.combinatorics :as combo]
            [clojure.string :as string])
  (:import (java.util Scanner)))

(defn next-higher-number
  "Next higher number that can be created of the digits in n"
  [n]
  (def numbers (sort (map read-string (map string/join (combo/permutations (seq (str n)))))))
  (if (> (count numbers) (.indexOf numbers n))
    (nth numbers (+ (.indexOf numbers n) 2))
    (false))
  )

(defn -main
  "Program entry-point"
  [& args]
  (def scan (Scanner. *in*))
  (println "Enter a number")
  (println "The next higher number of those digits are: " (next-higher-number (.nextLine scan)))
  )


