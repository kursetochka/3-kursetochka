from matplotlib import pyplot
with open('C:\\Users\\User\\Downloads\\res.csv') as f:
    res = [[int(j) for j in i.strip('\n').split(',')] for i in f.readlines()[1:]]
    k = [i[0] for i in res]
    x = [i[1] for i in res]
    average = sum(x) / len(x)
    pyplot.plot(k, x, label='x(k)')
    pyplot.axhline(average, color='red', label='average')
    pyplot.xlabel('k')
    pyplot.ylabel('x(k)')
    pyplot.legend()
    pyplot.grid()
    pyplot.savefig('C:\\Users\\User\\Downloads\\result.png')
    pyplot.show()
