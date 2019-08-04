(define (problem problem_6_aircraft_rand_1)
  (:domain wargame)
  (:objects b1 b2 b3 b4 b5 b6 r1 r2 r3 r4 r5 r6 - fighter)
  (:init

	; blue team
	(blue b1)
	(blue b2)
	(blue b3)
	(blue b4)
	(blue b5)
	(blue b6)

	; generation
	(fifth-gen b1)
	(fourth-gen b2)
	(fourth-gen b3)
	(fifth-gen b4)
	(fifth-gen b5)
	(fifth-gen b6)

	; order
	(front b1)
	(behind b2 b1)
	(behind b3 b2)
	(behind b4 b3)
	(behind b5 b4)
	(behind b6 b5)
	(last b6)

	; red team
	(red r1)
	(red r2)
	(red r3)
	(red r4)
	(red r5)
	(red r6)

	; generation
	(fourth-gen r1)
	(fourth-gen r2)
	(fifth-gen r3)
	(fifth-gen r4)
	(fourth-gen r5)
	(fifth-gen r6)

	; order
	(front r1)
	(behind r2 r1)
	(behind r3 r2)
	(behind r4 r3)
	(behind r5 r4)
	(behind r6 r5)
	(last r6)
  )

  (:goal (and (destroyed r1) (destroyed r2) (destroyed r3) (destroyed r4) (destroyed r5) (destroyed r6) (or  (not (destroyed b1)) (not (destroyed b2)) (not (destroyed b3)) (not (destroyed b4)) (not (destroyed b5)) (not (destroyed b6)))))
  (:goal-reward 1)
  (:metric maximize (reward))
)