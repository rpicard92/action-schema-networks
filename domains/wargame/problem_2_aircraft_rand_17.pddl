(define (problem problem_2_aircraft_rand_17)
  (:domain wargame)
  (:objects b1 b2 r1 r2 - fighter)
  (:init

	; blue team
	(blue b1)
	(blue b2)

	; generation
	(fourth-gen b1)
	(fourth-gen b2)

	; order
	(front b1)
	(behind b2 b1)
	(last b2)

	; red team
	(red r1)
	(red r2)

	; generation
	(fourth-gen r1)
	(fifth-gen r2)

	; order
	(front r1)
	(behind r2 r1)
	(last r2)
  )

  (:goal (and (destroyed r1) (destroyed r2) (or  (not (destroyed b1)) (not (destroyed b2)))))
  (:goal-reward 1)
  (:metric maximize (reward))
)