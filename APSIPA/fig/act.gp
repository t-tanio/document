se term pdf
se output 'fig/act.pdf'
se xr [-2:2]
se yr [-1:2]
se key bottom right

f(x) = 1. / (1 + exp(-x))
g(x) = (x >= 0) ? x : 0
plot f(x) lw 3 t 'Sigmoid',\
     g(x) lw 3 t 'ReLU'
