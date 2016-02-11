(ns dailyprogrammer
  (:require [clojure.string :as s]))

(map s/triml (s/split-lines (slurp "file.txt")))

(map s/trimr (s/split-lines (slurp "file.txt")))










