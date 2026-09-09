from functools import lru_cache
with open('C:\\Users\\User\\Downloads\\coeff.csv') as f1: # момент про кодировку пути
    coeff = list(map(int, f1.read().strip('\n').split(',')))
    @lru_cache()
    def x(k):
        if k == 0:
            return 1
        elif k < 0:
            return 0
        else:
            res = 0
            n = iter(range(1, len(coeff) + 2))
            for a in coeff:
                res += a * x(k - next(n))
            return res
with open('C:\\Users\\User\\Downloads\\res.csv', 'w') as f2:
    f2.write('k,x(k)\n')
    for k in range(0, 101):
        f2.write(f'{k},{x(k)}\n')
