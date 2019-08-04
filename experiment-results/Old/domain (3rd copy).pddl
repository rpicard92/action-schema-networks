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

  ; fourth on fourth
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

  (:action strike-fourth-on-fourth-last-blue-only
    :parameters (?b1 ?r1 ?r2 - fighter)
    :precondition 
	(and 
	(blue ?b1)
	(red ?r1)
	(red ?r2)		
	(front ?b1) 
	(front ?r1) 
	(fourth-gen ?b1) 
	(fourth-gen ?r1) 
	(last ?b1)
	(behind ?r2 ?r1)
	)
    :effect (probabilistic
        1/2 
	(destroyed ?b1)
        1/2 
	(and 
	(destroyed ?r1) 
	(not (front ?r1)) 
	(front ?r2) 
	(not (behind ?r2 ?r1))
  	)
  	)
  )

  (:action strike-fourth-on-fourth-last-red-only
    :parameters (?b1 ?b2 ?r1 - fighter)
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
	(last ?r1)
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
	(destroyed ?r1) 
  	)
  )

  (:action strike-fourth-on-fourth-last-blue-and-red
    :parameters (?b1 ?r1 - fighter)
    :precondition 
	(and 
	(blue ?b1)
	(red ?r1)
	(front ?b1) 
	(front ?r1) 
	(fourth-gen ?b1) 
	(fourth-gen ?r1) 
	(last ?b1)
	(last ?r1)
	)
    :effect (probabilistic
        1/2 
	(destroyed ?b1)
        1/2 
	(destroyed ?r1) 
	)
  )

  (:action evade-fourth-on-fourth
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

  ; fifth on fifth
  (:action strike-fifth-on-fifth
    :parameters (?b1 ?b2 ?r1 ?r2 - fighter)
    :precondition 
	(and 
	(blue ?b1)
	(blue ?b2)
	(red ?r1)
	(red ?r2)		
	(front ?b1) 
	(front ?r1) 
	(fifth-gen ?b1) 
	(fifth-gen ?r1) 
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

  (:action strike-fifth-on-fifth-last-blue-only
    :parameters (?b1 ?r1 ?r2 - fighter)
    :precondition 
	(and 
	(blue ?b1)
	(red ?r1)
	(red ?r2)		
	(front ?b1) 
	(front ?r1) 
	(fifth-gen ?b1) 
	(fifth-gen ?r1) 
	(last ?b1)
	(behind ?r2 ?r1)
	)
    :effect (probabilistic
        1/2 
	(destroyed ?b1)
        1/2 
	(and 
	(destroyed ?r1) 
	(not (front ?r1)) 
	(front ?r2) 
	(not (behind ?r2 ?r1))
  	)
  	)
  )

  (:action strike-fifth-on-fifth-last-red-only
    :parameters (?b1 ?b2 ?r1 - fighter)
    :precondition 
	(and 
	(blue ?b1)
	(blue ?b2)		
	(red ?r1)
	(front ?b1) 
	(front ?r1) 
	(fifth-gen ?b1) 
	(fifth-gen ?r1) 
	(behind ?b2 ?b1)
	(last ?r1)
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
	(destroyed ?r1) 
  	)
  )

  (:action strike-fifth-on-fifth-last-blue-and-red
    :parameters (?b1 ?r1 - fighter)
    :precondition 
	(and 
	(blue ?b1)
	(red ?r1)
	(front ?b1) 
	(front ?r1) 
	(fifth-gen ?b1) 
	(fifth-gen ?r1) 
	(last ?b1)
	(last ?r1)
	)
    :effect (probabilistic
        1/2 
	(destroyed ?b1)
        1/2 
	(destroyed ?r1) 
	)
  )

  (:action evade-fifth-on-fifth
    :parameters 
	(?b1 ?b2 ?B3 ?r1 - fighter)
    :precondition 
	(and 
	(blue ?b1)
	(blue ?b2)
	(red ?r1)	
	(front ?b1) 
	(front ?r1) 
	(fifth-gen ?b1) 
	(fifth-gen ?r1)
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

  ; fifth on fourth
  (:action strike-fifth-on-fourth
    :parameters (?b1 ?b2 ?r1 ?r2 - fighter)
    :precondition 
	(and 
	(blue ?b1)
	(blue ?b2)
	(red ?r1)
	(red ?r2)		
	(front ?b1) 
	(front ?r1) 
	(fifth-gen ?b1) 
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

  (:action strike-fifth-on-fourth-last-blue-only
    :parameters (?b1 ?r1 ?r2 - fighter)
    :precondition 
	(and 
	(blue ?b1)
	(red ?r1)
	(red ?r2)		
	(front ?b1) 
	(front ?r1) 
	(fifth-gen ?b1) 
	(fourth-gen ?r1) 
	(last ?b1)
	(behind ?r2 ?r1)
	)
    :effect (probabilistic
        1/2 
	(destroyed ?b1)
        1/2 
	(and 
	(destroyed ?r1) 
	(not (front ?r1)) 
	(front ?r2) 
	(not (behind ?r2 ?r1))
  	)
  	)
  )

  (:action strike-fifth-on-fourth-last-red-only
    :parameters (?b1 ?b2 ?r1 - fighter)
    :precondition 
	(and 
	(blue ?b1)
	(blue ?b2)		
	(red ?r1)
	(front ?b1) 
	(front ?r1) 
	(fifth-gen ?b1) 
	(fourth-gen ?r1) 
	(behind ?b2 ?b1)
	(last ?r1)
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
	(destroyed ?r1) 
  	)
  )

  (:action strike-fifth-on-fourth-last-blue-and-red
    :parameters (?b1 ?r1 - fighter)
    :precondition 
	(and 
	(blue ?b1)
	(red ?r1)
	(front ?b1) 
	(front ?r1) 
	(fifth-gen ?b1) 
	(fourth-gen ?r1) 
	(last ?b1)
	(last ?r1)
	)
    :effect (probabilistic
        1/2 
	(destroyed ?b1)
        1/2 
	(destroyed ?r1) 
	)
  )

  (:action evade-fifth-on-fourth
    :parameters 
	(?b1 ?b2 ?B3 ?r1 - fighter)
    :precondition 
	(and 
	(blue ?b1)
	(blue ?b2)
	(red ?r1)	
	(front ?b1) 
	(front ?r1) 
	(fifth-gen ?b1) 
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

  ; fourth on fifth
  (:action strike-fourth-on-fifth
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
	(fifth-gen ?r1) 
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

  (:action strike-fourth-on-fifth-last-blue-only
    :parameters (?b1 ?r1 ?r2 - fighter)
    :precondition 
	(and 
	(blue ?b1)
	(red ?r1)
	(red ?r2)		
	(front ?b1) 
	(front ?r1) 
	(fourth-gen ?b1) 
	(fifth-gen ?r1) 
	(last ?b1)
	(behind ?r2 ?r1)
	)
    :effect (probabilistic
        1/2 
	(destroyed ?b1)
        1/2 
	(and 
	(destroyed ?r1) 
	(not (front ?r1)) 
	(front ?r2) 
	(not (behind ?r2 ?r1))
  	)
  	)
  )

  (:action strike-fourth-on-fifth-last-red-only
    :parameters (?b1 ?b2 ?r1 - fighter)
    :precondition 
	(and 
	(blue ?b1)
	(blue ?b2)		
	(red ?r1)
	(front ?b1) 
	(front ?r1) 
	(fourth-gen ?b1) 
	(fifth-gen ?r1) 
	(behind ?b2 ?b1)
	(last ?r1)
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
	(destroyed ?r1) 
  	)
  )

  (:action strike-fourth-on-fifth-last-blue-and-red
    :parameters (?b1 ?r1 - fighter)
    :precondition 
	(and 
	(blue ?b1)
	(red ?r1)
	(front ?b1) 
	(front ?r1) 
	(fourth-gen ?b1) 
	(fifth-gen ?r1) 
	(last ?b1)
	(last ?r1)
	)
    :effect (probabilistic
        1/2 
	(destroyed ?b1)
        1/2 
	(destroyed ?r1) 
	)
  )

  (:action evade-fourth-on-fifth
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
	(fifth-gen ?r1)
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

