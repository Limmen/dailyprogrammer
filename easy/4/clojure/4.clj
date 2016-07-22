(ns dailyprogrammer)
(import '(java.util Scanner))

(def scan (Scanner. *in*))
(println "Enter number of passwords you want to generate")
(def n (Integer/parseInt (.nextLine scan)))

(defn pw_generator [n]
  (if (> n 0)
    (cons (rand-int 127) (pw_generator (- n 1)))
    ()))

(def passwords ())
(while (> n 0)
  (def passwords (concat passwords (pw_generator (+ (rand-int 8) 8))))
  (def n (- n 1)))

(println (apply str (map char (vec passwords))))


