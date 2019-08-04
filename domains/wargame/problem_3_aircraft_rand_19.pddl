(define (problem problem_3_aircraft_rand_19)
  (:domain wargame)
  (:objects b1 b2 b3 r1 r2 r3 - fighter)
  (:init

	; blue team
	(blue b1)
	(blue b2)
	(blue b3)

	; generation
	(fourth-gen b1)
	(fourth-gen b2)
	(fourth-gen b3)

	; order
	(front b1)
	(behind b2 b1)
	(behind b3 b2)
	(last b3)

	; red team
	(red r1)
	(red r2)
	(red r3)

	; generation
	(fourth-gen r1)
	(fifth-gen r2)
	(fourth-gen r3)

	; order
	(front r1)
	(behind r2 r1)
	(behind r3 r2)
	(last r3)
  )

  (:goal (and (destroyed r1) (destroyed r2) (destroyed r3) (or  (not (destroyed b1)) (not (destroyed b2)) (not (destroyed b3)))))
  (:goal-reward 1)
  (:metric maximize (reward))
)