se term pdf
se output 'fig/fig2.pdf'
se xl '年'
se yl '層の数'
# se xr [2010:2017]
# se key bottom right

set boxwidth 0.5 relative
set style fill solid border lc rgb "black"
plot "fig/imagenet.dat" u 0:3:xtic(1) with boxes lw 2 lc rgb 'blue' notitle
