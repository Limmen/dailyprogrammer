(ns dailyprogrammer)
(require '[clojure.string :as s])
(require '[clojure.set :as set])

(def morse-codes (set/map-invert 
                  {\A ".-"   \J ".---" \S "..."   \1 ".----" \. ".-.-.-" \: "---..."
                   \B "-..." \K "-.-"  \T "-"     \2 "..---" \, "--..--" \; "-.-.-."
                   \C "-.-." \L ".-.." \U "..-"   \3 "...--" \? "..--.." \= "-...-"
                   \D "-.."  \M "--"   \V "...-"  \4 "....-" \' ".----." \+ ".-.-."
                   \E "."    \N "-."   \W ".--"   \5 "....." \! "-.-.--" \- "-....-"
                   \F "..-." \O "---"  \X "-..-"  \6 "-...." \/ "-..-."  \_ "..--.-"
                   \G "--."  \P ".--." \Y "-.--"  \7 "--..." \( "-.--."  \" ".-..-."  ;"
                   \H "...." \Q "--.-" \Z "--.."  \8 "---.." \) "-.--.-" \$ "...-..-"
                   \I ".."   \R ".-."  \0 "-----" \9 "----." \& ".-..."  \@ ".--.-."
                   \space " "}))

(def morse-string ".... . .-.. .-.. --- / -.. .- .. .-.. -.-- / .--. .-. --- --. .-. .- -- -- . .-. / --. --- --- -.. / .-.. ..- -.-. -.- / --- -. / - .... . / -.-. .... .- .-.. .-.. . -. --. . ... / - --- -.. .- -.--")

 (s/join " "
        (map #(apply str %)
             (map (fn [x]
                    (map #(get morse-codes %) x))
                  (map #(s/split % #" ") words))))
