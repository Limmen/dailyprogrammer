(ns dailyprogrammer)

(println "Enter height of the triangel")
(def height (read-string (read-line)))

(loop [h height i "@"]
  (when (> h 0)
    (println (apply str i ))
    (recur (- h 1) (concat i "@"))))
