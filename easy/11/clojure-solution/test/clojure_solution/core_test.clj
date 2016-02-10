(ns clojure-solution.core-test
  (:require [clojure.test :refer :all]
            [clojure-solution.core :refer :all]
            [clj-time.core :as t]))

(deftest get-weekday-test
  (testing "get-weekday returning the right weekday"
  (is (= "wednesday" (get-weekday (t/date-time 2016 2 10))))
  (is (= "saturday" (get-weekday (t/date-time 1994 6 4))))
  (is (= "saturday" (get-weekday (t/date-time 2000 1 1))))))
