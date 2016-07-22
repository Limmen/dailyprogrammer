(defn concat-union
  "compares two lists, and append any elements in the second list that doesn't exist in the first"
  [a b]
  (concat a (remove (set a) b)))
