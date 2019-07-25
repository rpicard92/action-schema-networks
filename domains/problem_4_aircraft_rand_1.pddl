(define (problem problem_4_aircraft_rand_1)
  (:domain wargame)
  (:objects b1 b2 b3 b4 r1 r2 r3 r4 - fighter)
  (:init

	; blue team
	(blue b1)
	(blue b2)
	(blue b3)
	(blue b4)

	; generation
	(fifth-gen b1)
	(fourth-gen b2)
	(fourth-gen b3)
	(fifth-gen b4)

	; order
	(front b1)
	(behind b2 b1)
	(behind b3 b2)
	(behind b4 b3)
	(last b4)

	; red team
	(red r1)
	(red r2)
	(red r3)
	(red r4)

	; generation
	(fifth-gen r1)
	(fifth-gen r2)
	(fourth-gen r3)
	(fourth-gen r4)

	; order
	(front r1)
	(behind r2 r1)
	(behind r3 r2)
	(behind r4 r3)
	(last r4)
  )

  (:goal (and (destroyed r1) (destroyed r2) (destroyed r3) (destroyed r4) (or  (not (destroyed b1)) (not (destroyed b2)) (not (destroyed b3)) (not (destroyed b4)))))
  (:goal-reward 1)
  (:metric maximize (reward))
)