# scatter plotting with pyplot.
using PyPlot
using Random
x,y = randn(100),randn(100)
scatter(x,y)
display(gcf())
