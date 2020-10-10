# example to do...run with @btime macro.
using BenchmarkTools
function string_zeros(s::AbstractString)
    n = 1000_000
    x = s =="Int64" ? Vector{Int64}(undef,n) : Vector{Float64}(undef,n)
    return fill_zeros(x)
end
function fill_zeros(x)
    for i in 1:length(x)
        x[i]=0
    end
    return x
end
function arr_summary(x::Array{T}) where T <: Number
    r = zero(T)
    for i = 1:length(x)
        r = r + x[i] ^ 2
    end
    return r
end
