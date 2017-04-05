(set-logic UFNIA)
(set-info :smt-lib-version 2.5)

(declare-fun fixedAdd() Int)
(assert (= fixedAdd (+ 2 (+ 2 (+ 2 0)))))
(check-sat)

(define-fun-rec $$add$$ ((a Int)(b Int)) Int 
    (ite (= b 0) 
         0 
         (+ a ($$add$$ a (- b 1)))))

(declare-fun variableAdd() Int)
(assert (= variableAdd ($$add$$ 2 3)))
(check-sat)

(declare-fun fixedTimes() Int)
(assert (= fixedTimes (* 2 (* 2 (* 2 1)))))
(check-sat)
        
(define-fun-rec $$pow$$ ((a Int)(b Int)) Int 
    (ite (= b 0) 
         1 
         (* a ($$pow$$ a (- b 1)))))

(declare-fun variableTimes() Int)
(assert (= variableTimes ($$pow$$ 2 3)))
(check-sat)
