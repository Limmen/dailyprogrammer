;run in REPL with (load-file "1.clj")
(import '(java.util Scanner))
(def scan (Scanner. *in*))

(println "What is your Name?")
(def Name (.nextLine scan))

(println "What is your Age?")
(def age (.nextLine scan))

(println "What is your reddit username?")
(def username (.nextLine scan))

(println "Your name is " Name ", you are " age " years old, and your username is " username)
