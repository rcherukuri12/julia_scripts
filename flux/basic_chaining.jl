#example of creating chains in flux
using Flux, BenchmarkTools

model = Chain(x -> 3x^2, x -> 2x, x -> x+1 )

# now take a gradient of this model
@btime df(x) = Flux.gradient(model,x)[1]

@show model(5)
@show df(5)
