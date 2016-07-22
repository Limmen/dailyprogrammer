(ns dailyprogrammer)

(defn prime?
  "Checks wheter a given number is prime"
  [n]
  (loop [i 2]
    (if (>= i n)
      true
      (if (= (mod n i) 0)
        false
        (recur (inc i))))))


(defn generate-primes
  "Generates all prime numbers up to n"
  [n]
  (filter prime? (range n)))

;;(generate-primes 2000)
