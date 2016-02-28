(ns dailyprogrammer)


(defn remove-consecutive-duplicates
  ""
  [s]
  (let [groups (partition-by identity s)]
    [(apply str (map first groups))
     (apply str (mapcat rest groups))]))


(remove-consecutive-duplicates "ddaaiillyypprrooggrraammeerr")
