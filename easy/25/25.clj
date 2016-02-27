(defn election-decider [results]
  (let [[winner n] (last (sort-by second (frequencies results)))]
    (when (> n (/ (count results) 2))
      winner)))






















