(ns clojure-solution.core-test
  (:require [clojure.test :refer :all]
            [clojure-solution.core :refer :all]))

(deftest permutate-test
  (testing "Testing number of permutations"
    (is (= 1 (calc-permutations "h")))
    (is (= 2 (calc-permutations "hi")))
    (is (= 6 (calc-permutations "hi!")))
    (is (= 24 (calc-permutations "hij!")))))
