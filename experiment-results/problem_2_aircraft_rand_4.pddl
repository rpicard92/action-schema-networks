(define (problem problem_2_aircraft_rand_4)
  (:domain wargame)
  (:objects b1 b2 r1 r2 - fighter)
  (:init

	; blue team
	(blue b1)
	(blue b2)

	; generation
	(fifth-gen b1)
	(fifth-gen b2)

	; order
	(front b1)
	(behind b2 b1)
	(last b2)

	; red team
	(red r1)
	(red r2)

	; generation
	(fifth-gen r1)
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