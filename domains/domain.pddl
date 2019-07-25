(define (domain wargame)
  (:requirements :probabilistic-effects :conditional-effects :equality :typing :rewards)
  (:types fighter)
  (:predicates 
	(blue ?f - fighter)
	(red ?f - fighter)
	(fourth-gen ?f - fighter) 
	(fifth-gen ?f - fighter) 
	(front ?f - fighter)
	(last ?f - fighter)  
	(destroyed ?f - fighter)
	(behind ?f1 ?f2 - fighter)
	)

  ; strike
  (:action strike
    :parameters (?b1 ?b2 ?r1 ?r2 - fighter)
    :precondition 
	(and 
	(blue ?b1)
	(blue ?b2)
	(red ?r1)
	(red ?r2)		
	(front ?b1) 
	(front ?r1) 
	(not (= ?b1 ?b2))
	(not (= ?r1 ?r2))	
	)
    :effect (and
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
		; fourth-on-fourth
		(when (and (fourth-gen ?b1) (not (fifth-gen ?b1)) (fourth-gen ?r1) (not (fifth-gen ?r1)) (behind ?b2 ?b1) (behind ?r2 ?r1) (not (last ?b1)) (not (last ?r1)) )
			(probabilistic 
				0.5 (and 
				(destroyed ?b1) 
				(not (front ?b1)) 
				(front ?b2) 
				(not (behind ?b2 ?b1))
				)
				0.5 (and
				(destroyed ?r1) 
				(not (front ?r1)) 
				(front ?r2) 
				(not (behind ?r2 ?r1))
				)
			)
		)
		(when (and (fourth-gen ?b1) (not (fifth-gen ?b1)) (fourth-gen ?r1) (not (fifth-gen ?r1)) (or (not (behind ?b2 ?b1)) (not (behind ?r2 ?r1))) (last ?b1) (not (last ?r1)))
			(probabilistic 
				0.5
				(destroyed ?b1)
				0.5 (and
				(destroyed ?r1) 
				(not (front ?r1)) 
				(front ?r2) 
				(not (behind ?r2 ?r1))
				)
			)
		)
		(when (and (fourth-gen ?b1) (not (fifth-gen ?b1)) (fourth-gen ?r1) (not (fifth-gen ?r1)) (or (not (behind ?b2 ?b1)) (not (behind ?r2 ?r1))) (not (last ?b1)) (last ?r1))
			(probabilistic 
				0.5 (and 
				(destroyed ?b1) 
				(not (front ?b1)) 
				(front ?b2) 
				(not (behind ?b2 ?b1))
				)
				0.5
				(destroyed ?r1)
			)
		)
		(when (and (fourth-gen ?b1) (not (fifth-gen ?b1)) (fourth-gen ?r1) (not (fifth-gen ?r1)) (or (not (behind ?b2 ?b1)) (not (behind ?r2 ?r1))) (last ?b1) (last ?r1))
			(probabilistic 
				0.5
				(destroyed ?b1)
				0.5
				(destroyed ?r1)
			)
		)
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
		; fifth-on-fifth
		(when (and (fifth-gen ?b1) (not (fourth-gen ?b1)) (fifth-gen ?r1) (not (fourth-gen ?r1)) (behind ?b2 ?b1) (behind ?r2 ?r1) (not (last ?b1)) (not (last ?r1)) )
			(probabilistic 
				0.5 (and 
				(destroyed ?b1) 
				(not (front ?b1)) 
				(front ?b2) 
				(not (behind ?b2 ?b1))
				)
				0.5 (and
				(destroyed ?r1) 
				(not (front ?r1)) 
				(front ?r2) 
				(not (behind ?r2 ?r1))
				)
			)
		)
		(when (and (fifth-gen ?b1) (not (fourth-gen ?b1)) (fifth-gen ?r1) (not (fourth-gen ?r1)) (or (not (behind ?b2 ?b1)) (not (behind ?r2 ?r1))) (last ?b1) (not (last ?r1)))
			(probabilistic 
				0.5
				(destroyed ?b1)
				0.5 (and
				(destroyed ?r1) 
				(not (front ?r1)) 
				(front ?r2) 
				(not (behind ?r2 ?r1))
				)
			)
		)
		(when (and (fifth-gen ?b1) (not (fourth-gen ?b1)) (fifth-gen ?r1) (not (fourth-gen ?r1)) (or (not (behind ?b2 ?b1)) (not (behind ?r2 ?r1))) (not (last ?b1)) (last ?r1))
			(probabilistic 
				0.5 (and 
				(destroyed ?b1) 
				(not (front ?b1)) 
				(front ?b2) 
				(not (behind ?b2 ?b1))
				)
				0.5
				(destroyed ?r1)
			)
		)
		(when (and (fifth-gen ?b1) (not (fourth-gen ?b1)) (fifth-gen ?r1) (not (fourth-gen ?r1)) (or (not (behind ?b2 ?b1)) (not (behind ?r2 ?r1))) (last ?b1) (last ?r1))
			(probabilistic 
				0.5
				(destroyed ?b1)
				0.5
				(destroyed ?r1)
			)
		)

		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
		; fifth-on-fourth
		(when (and (fifth-gen ?b1) (not (fourth-gen ?b1)) (fourth-gen ?r1) (not (fifth-gen ?r1)) (behind ?b2 ?b1) (behind ?r2 ?r1) (not (last ?b1)) (not (last ?r1)) )
			(probabilistic 
				0.1 (and 
				(destroyed ?b1) 
				(not (front ?b1)) 
				(front ?b2) 
				(not (behind ?b2 ?b1))
				)
				0.9 (and
				(destroyed ?r1) 
				(not (front ?r1)) 
				(front ?r2) 
				(not (behind ?r2 ?r1))
				)
			)
		)
		(when (and (fifth-gen ?b1) (not (fourth-gen ?b1)) (fourth-gen ?r1) (not (fifth-gen ?r1)) (or (not (behind ?b2 ?b1)) (not (behind ?r2 ?r1))) (last ?b1) (not (last ?r1)))
			(probabilistic 
				0.1
				(destroyed ?b1)
				0.9 (and
				(destroyed ?r1) 
				(not (front ?r1)) 
				(front ?r2) 
				(not (behind ?r2 ?r1))
				)
			)
		)
		(when (and (fifth-gen ?b1) (not (fourth-gen ?b1)) (fourth-gen ?r1) (not (fifth-gen ?r1)) (or (not (behind ?b2 ?b1)) (not (behind ?r2 ?r1))) (not (last ?b1)) (last ?r1))
			(probabilistic 
				0.1 (and 
				(destroyed ?b1) 
				(not (front ?b1)) 
				(front ?b2) 
				(not (behind ?b2 ?b1))
				)
				0.9
				(destroyed ?r1)
			)
		)
		(when (and (fifth-gen ?b1) (not (fourth-gen ?b1)) (fourth-gen ?r1) (not (fifth-gen ?r1)) (or (not (behind ?b2 ?b1)) (not (behind ?r2 ?r1))) (last ?b1) (last ?r1))
			(probabilistic 
				0.1
				(destroyed ?b1)
				0.9
				(destroyed ?r1)
			)
		)

		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
		; fourth-on-fifth
		(when (and (fourth-gen ?b1) (not (fifth-gen ?b1)) (fifth-gen ?r1) (not (fourth-gen ?r1)) (behind ?b2 ?b1) (behind ?r2 ?r1) (not (last ?b1)) (not (last ?r1)) )
			(probabilistic 
				0.9 (and 
				(destroyed ?b1) 
				(not (front ?b1)) 
				(front ?b2) 
				(not (behind ?b2 ?b1))
				)
				0.1 (and
				(destroyed ?r1) 
				(not (front ?r1)) 
				(front ?r2) 
				(not (behind ?r2 ?r1))
				)
			)
		)
		(when (and (fourth-gen ?b1) (not (fifth-gen ?b1)) (fifth-gen ?r1) (not (fourth-gen ?r1)) (or (not (behind ?b2 ?b1)) (not (behind ?r2 ?r1))) (last ?b1) (not (last ?r1)))
			(probabilistic 
				0.9
				(destroyed ?b1)
				0.1 (and
				(destroyed ?r1) 
				(not (front ?r1)) 
				(front ?r2) 
				(not (behind ?r2 ?r1))
				)
			)
		)
		(when (and (fourth-gen ?b1) (not (fifth-gen ?b1)) (fifth-gen ?r1) (not (fourth-gen ?r1)) (or (not (behind ?b2 ?b1)) (not (behind ?r2 ?r1))) (not (last ?b1)) (last ?r1))
			(probabilistic 
				0.9 (and 
				(destroyed ?b1) 
				(not (front ?b1)) 
				(front ?b2) 
				(not (behind ?b2 ?b1))
				)
				0.1
				(destroyed ?r1)
			)
		)
		(when (and (fourth-gen ?b1) (not (fifth-gen ?b1)) (fifth-gen ?r1) (not (fourth-gen ?r1)) (or (not (behind ?b2 ?b1)) (not (behind ?r2 ?r1))) (last ?b1) (last ?r1))
			(probabilistic 
				0.9
				(destroyed ?b1)
				0.1
				(destroyed ?r1)
			)
		)

	)
   )

  ; evade
  (:action evade
    :parameters (?b1 ?b2 ?b3 ?r1 - fighter)
    :precondition 
	(and 
	(blue ?b1)
	(blue ?b2)
	(blue ?b3)
	(red ?r1)
	(front ?b1) 
	(front ?r1) 
	(not (last ?b1))
	(not (= ?b1 ?b2))
	(not (= ?b2 ?b3))
	(not (= ?b3 ?b1))
	(behind ?b2 ?b1)
	)
    :effect (and
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
		; fourth-on-fourth - more than two left
		(when (and (fourth-gen ?b1) (not (fifth-gen ?b1)) (fourth-gen ?r1) (not (fifth-gen ?r1)) (behind ?b2 ?b1) (not (last ?b1)) (not (last ?b2)) (last ?b3) )
			(probabilistic 
				1/4 
				(and 
				(destroyed ?b1) 
				(not (front ?b1)) 
				(front ?b2) 
				(not (behind ?b2 ?b1))
				)
				3/4 
				(and 
				(not (behind ?b2 ?b1)) 
				(behind ?b1 ?b3) 
				(last ?b1) 
				(not (last ?b3)) 
				(front ?b2)
				(not (front ?b1)) 
				)
			)
		)
		; fourth-on-fourth - two left
		(when (and (fourth-gen ?b1) (not (fifth-gen ?b1)) (fourth-gen ?r1) (not (fifth-gen ?r1)) (behind ?b2 ?b1) (not (last ?b1)) (last ?b2) (not (last ?b3)) )
			(probabilistic 
				1/4 
				(and 
				(destroyed ?b1) 
				(not (front ?b1)) 
				(front ?b2) 
				(not (behind ?b2 ?b1))
				)
				3/4 
				(and 
				(not (behind ?b2 ?b1)) 
				(behind ?b1 ?b2) 
				(last ?b1) 
				(not (last ?b2)) 
				(front ?b2)
				(not (front ?b1)) 
				)
			)
		)

		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
		; fifth-on-fifth - more than two left
		(when (and (fifth-gen ?b1) (not (fourth-gen ?b1)) (fifth-gen ?r1) (not (fourth-gen ?r1)) (behind ?b2 ?b1) (not (last ?b1)) (not (last ?b2)) (last ?b3) )
			(probabilistic 
				1/4 
				(and 
				(destroyed ?b1) 
				(not (front ?b1)) 
				(front ?b2) 
				(not (behind ?b2 ?b1))
				)
				3/4 
				(and 
				(not (behind ?b2 ?b1)) 
				(behind ?b1 ?b3) 
				(last ?b1) 
				(not (last ?b3)) 
				(front ?b2)
				(not (front ?b1)) 
				)
			)
		)
		; fourth-on-fourth - two left
		(when (and (fifth-gen ?b1) (not (fourth-gen ?b1)) (fifth-gen ?r1) (not (fourth-gen ?r1)) (behind ?b2 ?b1) (not (last ?b1)) (last ?b2) (not (last ?b3)) )
			(probabilistic 
				1/4 
				(and 
				(destroyed ?b1) 
				(not (front ?b1)) 
				(front ?b2) 
				(not (behind ?b2 ?b1))
				)
				3/4 
				(and 
				(not (behind ?b2 ?b1)) 
				(behind ?b1 ?b2) 
				(last ?b1) 
				(not (last ?b2)) 
				(front ?b2)
				(not (front ?b1)) 
				)
			)
		)


		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
		; fifth-on-fourth - more than two left
		(when (and (fifth-gen ?b1) (not (fourth-gen ?b1)) (fourth-gen ?r1) (not (fifth-gen ?r1)) (behind ?b2 ?b1) (not (last ?b1)) (not (last ?b2)) (last ?b3) )
			(probabilistic 
				1/4 
				(and 
				(destroyed ?b1) 
				(not (front ?b1)) 
				(front ?b2) 
				(not (behind ?b2 ?b1))
				)
				3/4 
				(and 
				(not (behind ?b2 ?b1)) 
				(behind ?b1 ?b3) 
				(last ?b1) 
				(not (last ?b3)) 
				(front ?b2)
				(not (front ?b1)) 
				)
			)
		)
		; fifth-on-fourth - two left
		(when (and (fifth-gen ?b1) (not (fourth-gen ?b1)) (fourth-gen ?r1) (not (fifth-gen ?r1)) (behind ?b2 ?b1) (not (last ?b1)) (last ?b2) (not (last ?b3)) )
			(probabilistic 
				1/4 
				(and 
				(destroyed ?b1) 
				(not (front ?b1)) 
				(front ?b2) 
				(not (behind ?b2 ?b1))
				)
				3/4 
				(and 
				(not (behind ?b2 ?b1)) 
				(behind ?b1 ?b2) 
				(last ?b1) 
				(not (last ?b2)) 
				(front ?b2)
				(not (front ?b1)) 
				)
			)
		)


		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
		; fourth-on-fifth - more than two left
		(when (and (fourth-gen ?b1) (not (fifth-gen ?b1)) (fifth-gen ?r1) (not (fourth-gen ?r1)) (behind ?b2 ?b1) (not (last ?b1)) (not (last ?b2)) (last ?b3) )
			(probabilistic 
				1/4 
				(and 
				(destroyed ?b1) 
				(not (front ?b1)) 
				(front ?b2) 
				(not (behind ?b2 ?b1))
				)
				3/4 
				(and 
				(not (behind ?b2 ?b1)) 
				(behind ?b1 ?b3) 
				(last ?b1) 
				(not (last ?b3)) 
				(front ?b2)
				(not (front ?b1)) 
				)
			)
		)
		; fourth-on-fifth - two left
		(when (and (fourth-gen ?b1) (not (fifth-gen ?b1)) (fifth-gen ?r1) (not (fourth-gen ?r1)) (behind ?b2 ?b1) (not (last ?b1)) (last ?b2) (not (last ?b3)) )
			(probabilistic 
				1/4 
				(and 
				(destroyed ?b1) 
				(not (front ?b1)) 
				(front ?b2) 
				(not (behind ?b2 ?b1))
				)
				3/4 
				(and 
				(not (behind ?b2 ?b1)) 
				(behind ?b1 ?b2) 
				(last ?b1) 
				(not (last ?b2)) 
				(front ?b2)
				(not (front ?b1)) 
				)
			)
		)
	)
   )


)




