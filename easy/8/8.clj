(ns dailyprogrammer)

(defn beer-song
  ([]
   (loop [n 99]
     (when (> n 0)
     (print n "bottles of beer on the wall, " n "bottles of beer. Take one down and pass it around, " (- n 1)  "bottles of beer on the wall.")
     (recur (- n 1)))))
  ([x]
   (loop [n x]
     (when (> n 0)
     (print n "bottles of beer on the wall, " n "bottles of beer. Take one down and pass it around, " (- n 1)  "bottles of beer on the wall.")
     (recur (- n 1))))))

(beer-song)

