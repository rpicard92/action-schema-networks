(define (problem wargame_5_p02)
  (:domain wargame)
  (:objects b1 b2 b3 b4 b5 r1 r2 r3 r4 r5 - fighter)
  (:init 
	; blue team
	(blue b1)
	(blue b2)
	(blue b3)
	(blue b4)
	(blue b5)

	; generation
	(fourth-gen b1)
	(fourth-gen b2)
	(fourth-gen b3)
	(fourth-gen b4)
	(fourth-gen b5)

	; order	
	(front b1)
	(behind b2 b1)
	(behind b3 b2)
	(behind b4 b3)
	(behind b5 b4)	
	(last b5)
	
	; red team
	(red r1)
	(red r2)
	(red r3)
	(red r4)
	(red r5)

	; generation
	(fourth-gen r1)
	(fourth-gen r2)
	(fourth-gen r3)
	(fourth-gen r4)
	(fourth-gen r5)

	; order	
	(front r1)
	(behind r2 r1)
	(behind r3 r2)
	(behind r4 r3)
	(behind r5 r4)	
	(last r5)

	)


  (:goal (and (destroyed r1) (destroyed r2) (destroyed r3) (destroyed r4) (destroyed r5)))
  (:goal-reward 1)
  (:metric maximize (reward))
)
