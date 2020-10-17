#simple MNIST example with training on gpu
# once we build model , we simply push
# the loss function, and datasets to gpu to achieve this.
using Base64
using Flux,Statistics,BenchmarkTools, MLBase, Flux.Data.MNIST
using Flux: onehotbatch, onecold
using Base.Iterators: repeated
using ColorTypes
using MLJBase
using CUDA

#load training dataset
imgs = Flux.Data.MNIST.images()
print(size(imgs))
# flatten all thsimple_mniste 28x28 into 764 input [reshape(image,:) for image in imgs ]
# Reorder the layout of the data for the ANN
imagestrip(image::Matrix{<:ColorTypes.Gray}) = Float32.(reshape(image, :))
X = hcat(imagestrip.(imgs)...)
#Target to one-hot
labels = Flux.Data.MNIST.labels()
Y = onehotbatch(labels,0:9)
# defining the model ( a neural network )
m = Chain(
                Dense(784,32,relu),
                Dense(32,10),
                softmax
         ) |> gpu

loss(x, y) = Flux.Losses.crossentropy(m(X),Y)
data = Flux.Data.DataLoader((X, Y), batchsize=128) |> gpu
#data = Base.Iterators.repeated(data,200)
opt = Flux.Optimise.ADAM(0.1) |> gpu

# test dataset
tX = hcat(float.(reshape.(Flux.Data.MNIST.images(:test), :))...) |> gpu
tY = onehotbatch(Flux.Data.MNIST.labels(:test), 0:9) |> gpu
# train for 10 epochs
using IterTools: ncycle
@btime Flux.Optimise.train!(loss, Flux.params(m), ncycle(data, 2), opt, cb =  () -> println(loss(tX,tY)))
acc(x, y) = mean(onecold((m(x))) .== onecold(y))
@show acc(tX, tY)


#@show MLJBase.confusion_matrix(onecold((m(tX))),onecold(tY))
