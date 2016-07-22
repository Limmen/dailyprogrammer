(ns dailyprogrammer
  (:require [clojure.string :as s]))

(defn reverse-block
  ""
  [input k]
  (when (not (= input ()))
    (concat (reverse (take k input)) (reverse-block (drop k input) k))))

(println "Enter block size")
(def k (read-string (read-line)))
(println "Enter numbers separated by space")
(def input (map #(Integer/parseInt %) (s/split (read-line) #" ")))

(reverse-block input k)









