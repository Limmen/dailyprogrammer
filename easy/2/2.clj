(import '(java.util Scanner))
(def scan (Scanner. *in*))

(defn mass [f a]
  (def m (/ f a))
  (println "The mass is: " m))

(defn acc [f m]
  (def a (/ f m))
  (println "The acceleration is: " a))

(defn force [m a]
  (def f (* m a))
  (println "The force is: " f))


(println "What would you like to find? type Type F for force, M for mass, or A for Acceleration")

(def input (.nextLine scan))

(force 10 10)

(if (= input "F")
 (do (println "What is the mass?")
  (def m (.nextInt scan))
  (println "What is the acceleration?")
  (def a (.nextInt scan))
  (force m a))
 (if (= input "M")
 (do (println "What is the force?")
  (def f (.nextInt scan))
  (println "What is the acceleration?")
  (def a (.nextInt scan))
  (mass f a))
  (if (= input "A")
 (do (println "What is the force?")
  (def f (.nextInt scan))
  (println "What is the mass?")
  (def m (.nextInt scan))
  (acc f m)))))



 
