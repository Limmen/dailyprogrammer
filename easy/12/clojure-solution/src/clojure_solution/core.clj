(ns clojure-solution.core
  (:gen-class)
  (:require [clojure.math.combinatorics :as combo]))

(defn calc-permutations
  "Calculates number of permutations of string"
  [input]
  (count (combo/permutations input)))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (println "Enter input to calculate permutations")
  (def input (read-line))
  (println "Number of possible permutations is:"
           (calc-permutations input)))










