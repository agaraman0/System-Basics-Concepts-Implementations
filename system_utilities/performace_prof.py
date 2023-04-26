import cProfile
import pstats

def profile(func, filename='profile.prof'):
    cProfile.runctx('func()', globals(), locals(), 
filename=filename)

    stats = pstats.Stats(filename)
    stats.strip_dirs().sort_stats('cumtime').print_stats()
    stats.strip_dirs().sort_stats('tottime').print_stats()

    stats.sort_stats('cumtime').print_callers(20)
    stats.sort_stats('tottime').print_callers(20)

