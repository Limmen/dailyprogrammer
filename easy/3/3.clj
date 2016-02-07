(import '(java.util Scanner))
(def scan (Scanner. *in*))

(println "Enter string to encrypt:")
(def input (.nextLine scan));.method is shortcut for calling methods

(defn encrypt-char [offset c]
(if (Character/isLetter c) ;/ is used to call static methods
    (let [v (int c)
          base (if (>= v (int \a))
                 (int \a)
                 (int \A))
          offset (mod offset 26)] ;works with negative offsets too!
      (char (+ (mod (+ (- v base) offset) 26)
               base)))
    c))

(defn encrypt [offset text]
  (apply str (map #(encrypt-char offset %) text)))


(println (encrypt 10 input))

