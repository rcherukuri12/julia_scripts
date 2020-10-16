# simple example of loading Flux data and examining.
using Flux, BenchmarkTools, Statistics

labels      = Flux.Data.Iris.labels()
features    = Flux.Data.Iris.features()

display(features[1,1:2])

n_features = Flux.normalise(features,dims = 2)

display(n_features[1,1:2])

display(size(n_features))
klasses = sort(unique(labels))
display(klasses)
hlabels = Flux.onehotbatch(labels,klasses)

display(hlabels)
display(size(labels))
display(size(hlabels))
# now bring back the old labels from one-hot encoding
old_labels = Flux.onecold(hlabels,klasses)
@assert labels == old_labels
