(define (problem problem_8_aircraft_rand_1)
  (:domain wargame)
  (:objects b1 b2 b3 b4 b5 b6 b7 b8 r1 r2 r3 r4 r5 r6 r7 r8 - fighter)
  (:init

	; blue team
	(blue b1)
	(blue b2)
	(blue b3)
	(blue b4)
	(blue b5)
	(blue b6)
	(blue b7)
	(blue b8)

	; generation
	(fifth-gen b1)
	(fourth-gen b2)
	(fourth-gen b3)
	(fifth-gen b4)
	(fifth-gen b5)
	(fifth-gen b6)
	(fourth-gen b7)
	(fourth-gen b8)

	; order
	(front b1)
	(behind b2 b1)
	(behind b3 b2)
	(behind b4 b3)
	(behind b5 b4)
	(behind b6 b5)
	(behind b7 b6)
	(behind b8 b7)
	(last b8)

	; red team
	(red r1)
	(red r2)
	(red r3)
	(red r4)
	(red r5)
	(red r6)
	(red r7)
	(red r8)

	; generation
	(fifth-gen r1)
	(fifth-gen r2)
	(fourth-gen r3)
	(fifth-gen r4)
	(fourth-gen r5)
	(fifth-gen r6)
	(fifth-gen r7)
	(fourth-gen r8)

	; order
	(front r1)
	(behind r2 r1)
	(behind r3 r2)
	(behind r4 r3)
	(behind r5 r4)
	(behind r6 r5)
	(behind r7 r6)
	(behind r8 r7)
	(last r8)
  )

  (:goal (and (destroyed r1) (destroyed r2) (destroyed r3) (destroyed r4) (destroyed r5) (destroyed r6) (destroyed r7) (destroyed r8) (or  (not (destroyed b1)) (not (destroyed b2)) (not (destroyed b3)) (not (destroyed b4)) (not (destroyed b5)) (not (destroyed b6)) (not (destroyed b7)) (not (destroyed b8)))))
  (:goal-reward 1)
  (:metric maximize (reward))
)