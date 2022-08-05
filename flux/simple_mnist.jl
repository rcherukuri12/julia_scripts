#simple MNIST example
using Base64
using Flux,Statistics,BenchmarkTools, MLBase
using ColorTypes
using MLJBase
using MLJ
using MLDatasets: MNIST
using Flux: train!, onehotbatch

x_train, y_train = MNIST(:train)[:];
x_test, y_test = MNIST(:test)[:];

x_train = Float32.(x_train)
y_train = Flux.onehotbatch(y_train, 0:9)
model = Chain(
    Dense(784, 256, relu),
    Dense(256, 64, relu),
    Dense(64, 128, relu),
    Dense(128, 10, relu), softmax
)

loss(x, y) = Flux.Losses.logitcrossentropy(model(x), y)
optimizer = ADAM(0.01)
#parameters = params(model)
train_data = [(Flux.flatten(x_train), y_train)]
test_data = [(Flux.flatten(x_test), y_test)]

Flux.@epochs 400 Flux.train!(loss, Flux.params(model), train_data, optimizer)

# using IterTools: ncycle
# Flux.Optimise.train!(loss, Flux.params(m), ncycle(data, 2), opt, cb =  () -> println(loss(tX,tY)))
pred = Flux.onecold(model(Flux.flatten(x_test)),[0,1,2,3,4,5,6,7,8,9])
print(MLJ.Accuracy()(pred, y_test))
display(MLJBase.ConfusionMatrix()(pred, y_test))
print("\n")