(defn halv
  " Return the two halves as different lists."
  [l]
  (split-at (/ (count l) 2) l))

(halv [1 2 3 4 5 6 7 8 9 10])
