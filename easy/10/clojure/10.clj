(ns dailyprogrammer)
(import '(java.util Scanner))
(def scan (Scanner. *in*))

(println "Enter a phonenumber to validate")
(def tel (.nextLine scan))

(defn validate [tel]
  (if (= nil (re-matches #"[0-9]{10}|([0-9]{3}-)?[0-9]{3}-[0-9]{4}|[0-9]{3}\.[0-9]{3}\.[0-9]{4}|\([0-9]{3}\) ?[0-9]{3}-[0-9]{4}" tel))
    (println "Not Valid")
    (println "Valid")))

(validate tel)

;(validate "1234567890")



