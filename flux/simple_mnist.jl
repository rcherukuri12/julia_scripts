#=simple MNIST example
RESULTS:
Acccuracy = 0.9721
Confusion Matrix:
┌ Warning: The classes are un-ordered,
│ using order: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].

10×10 Matrix{Int64}:
 971     0    6    0    1    4    8    0    3    6
   0  1121    2    2    0    0    4    2    0    2
   1     4  999    5    8    0    3    7    2    1
   2     2    4  984    1   13    1    3   12    9
   0     0    2    1  955    1    4    2    4   11
   1     1    0    4    0  860    5    1    6    5
   0     2    4    1    3    5  929    0    2    0
   2     1    8    6    3    1    1  999    4    5
   3     4    7    6    2    6    3    5  938    5
   0     0    0    1    9    2    0    9    3  965

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
    Dense(784, 512, elu),
    Dense(512, 512, elu),
    Dense(512, 512, elu),
    Dense(512, 10, elu), softmax
) |> gpu

loss(x, y) = Flux.Losses.logitcrossentropy(model(x), y) |> gpu
optimizer = ADAM(0.0001) |> gpu
train_data = [(Flux.flatten(x_train), y_train)] |> gpu
Flux.@epochs 8000 Flux.train!(loss, Flux.params(model), train_data, optimizer) |> gpu

# bring back the model from gpu
model = model |> cpu

test_data = [(Flux.flatten(x_test), y_test)] #|> gpu
pred = Flux.onecold(model(Flux.flatten(x_test)),0:9)

print(MLJ.Accuracy()(pred, y_test))
display(MLJBase.ConfusionMatrix()(pred, y_test))
print("\n")
