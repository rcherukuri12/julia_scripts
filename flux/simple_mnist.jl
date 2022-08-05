#=simple MNIST example
RESULTS:
Acccuracy = 0.9546┌
Confusion Matrix:
10×10 Matrix{Int64}:
 966     0    7    1    1    6   11    2    4   10
   0  1115    1    1    1    1    3    6    2    6
   0     3  973   12    5    0    3   20    4    1
   1     2    7  960    0   16    2    3   16   13
   0     0    7    0  942    4    5    4    6   15
   3     1    1    9    0  836    9    1    6    4
   6     4    6    1    9    9  922    0    5    1
   2     2   12    9    3    2    0  975    9   12
   2     8   16   13    3   12    3    3  918    8
   0     0    2    4   18    6    0   14    4  939

=#
using Base64
using Flux,Statistics,BenchmarkTools, MLBase
using ColorTypes
using MLJBase
using MLJ
using MLDatasets: MNIST
using Flux: train!, onehotbatch

x_train, y_train = MNIST(:train)[:];
x_test, y_test = MNIST(:test)[:];

x_train = Float32.(x_train) |> gpu
y_train = Flux.onehotbatch(y_train, 0:9) |> gpu
model = Chain(
    Dense(784, 256, relu),
    Dense(256, 256, relu),
    Dense(256, 256, relu),
    Dense(256, 10, relu), softmax
) |> gpu

loss(x, y) = Flux.Losses.logitcrossentropy(model(x), y) |> gpu
optimizer = ADAM(0.00001) |> gpu
train_data = [(Flux.flatten(x_train), y_train)] |> gpu
Flux.@epochs 4000 Flux.train!(loss, Flux.params(model), train_data, optimizer) |> gpu

# bring back the model from gpu
model = model |> cpu

test_data = [(Flux.flatten(x_test), y_test)] #|> gpu
pred = Flux.onecold(model(Flux.flatten(x_test)),0:9)

print(MLJ.Accuracy()(pred, y_test))
display(MLJBase.ConfusionMatrix()(pred, y_test))
print("\n")