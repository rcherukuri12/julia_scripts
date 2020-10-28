# this example shows subplotting and
# use of layout.
using Plots
using Random
y = randn(100,4)
f = scatter(x, y, layout = (4, 1))
display(f)
