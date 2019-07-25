"""For experiments on Exploding Wargame."""

PDDL_DIR = '../problems/ippc08/domains/wargame/'
COMMON_PDDLS = ['domain.pddl']
TRAIN_PDDLS = [
    'problem_3_aircraft_rand_1.pddl',
    'problem_3_aircraft_rand_2.pddl',
    'problem_3_aircraft_rand_3.pddl'
]
TRAIN_NAMES = None
TEST_RUNS = [
    (['problem_3_aircraft_rand_4.pddl'], None),
    (['problem_3_aircraft_rand_5.pddl'], None),

]  # yapf: disable
