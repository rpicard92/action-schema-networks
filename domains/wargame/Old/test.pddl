(define (problem wargame_5_p01)
  (:domain wargame)
  (:objects b1 r1 - fighter)
  (:init 
	; blue team
	(blue b1)

	; generation
	(fourth-gen b1)

	; order	
	(front b1)
	(last b1)
	
	; red team
	(red r1)

	; generation
	(fourth-gen r1)

	; order	
	(front r1)
	(last r1)

	)


  (:goal (destroyed r1))
  (:goal-reward 1)
  (:metric maximize (reward))
)
