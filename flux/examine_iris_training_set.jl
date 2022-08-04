# simple example of loading Flux data and examining.
using DataFrames
using Flux, BenchmarkTools, Statistics
using MLDatasets: Iris

labels      = Iris(as_df=false).targets
features    = Iris(as_df=false).features

display(features[1,1:2])

n_features = Flux.normalise(features,dims = 2)

display(n_features[1,1:2])

display(size(n_features))
classes = sort(unique(labels))
display(classes)
hlabels = Flux.onehotbatch(labels,classes)

display(hlabels)
display(size(labels))
display(size(hlabels))
# now bring back the old labels from one-hot encoding
old_labels = Flux.onecold(hlabels,classes)
@assert labels == old_labels
