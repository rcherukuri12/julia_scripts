#simple multiplot
using Plots
using Random
y = randn(100,4)
p1 = plot(x, y) # Make a line plot
p2 = scatter(x, y) # Make a scatter plot
p3 = scatter(x, y[:,1], ylabel = "y1", lw = 3, title = "Column 1 scatter")
p4 = histogram(x, y) # Four histograms each with 10 points? Why not!
f = plot(p1, p2, p3, p4, layout = (4, 1), legend = false)
display(f)
