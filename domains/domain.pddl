(define (domain wargame)
  (:requirements :probabilistic-effects :conditional-effects :equality :typing :rewards)
  (:types fighter)
  (:predicates 
	(blue ?f - fighter)
	(red ?f - fighter)
	(fourth-gen ?f - fighter) 
	(front ?f - fighter)
	(last ?f - fighter)  
	(destroyed ?f - fighter)
	(behind ?f1 ?f2 - fighter)
	)

  (:action strike-fourth-on-fourth
    :parameters (?b1 ?b2 ?r1 ?r2 - fighter)
    :precondition 
	(and 
	(blue ?b1)
	(blue ?b2)
	(red ?r1)
	(red ?r2)		
	(front ?b1) 
	(front ?r1) 
	(fourth-gen ?b1) 
	(fourth-gen ?r1) 
	(behind ?b2 ?b1)
	(behind ?r2 ?r1)
	)
    :effect (probabilistic
        1/2 
	(and 
	(destroyed ?b1) 
	(not (front ?b1)) 
	(front ?b2) 
	(not (behind ?b2 ?b1))
	)
        1/2 
	(and 
	(destroyed ?r1) 
	(not (front ?r1)) 
	(front ?r2) 
	(not (behind ?r2 ?r1))
  	)
	)
  )

  (:action strike-fourth-on-fourth-last
    :parameters (?b1 ?r1 - fighter)
    :precondition (and 
	(blue ?b1)
	(red ?r1)	
	(front ?b1) 
	(front ?r1) 
	(fourth-gen ?b1) 
	(fourth-gen ?r1) 
	(or (last ?b1) (last ?r1))
	)
    :effect (probabilistic
        1/2 (destroyed ?b1)
        1/2 (destroyed ?r1)
  	)
  )

  (:action evade_4th_on_4th
    :parameters 
	(?b1 ?b2 ?B3 ?r1 - fighter)
    :precondition 
	(and 
	(blue ?b1)
	(blue ?b2)
	(red ?r1)	
	(front ?b1) 
	(front ?r1) 
	(fourth-gen ?b1) 
	(fourth-gen ?r1)
	(behind ?b2 ?b1)
	(last ?b3)
	(not (last ?b1))
	)
    :effect
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
	(not (front ?B1)) 
	)
  	)
  )
)

