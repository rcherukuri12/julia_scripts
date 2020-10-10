#loop fix example
using Base64, Profile, Test

function sum_sqrt_n(n)
    r = 0.0 # this is initialized with float instead of int to solve instability
    for i = 1:n
        r = r +sqrt(i)
    end
    return r
end
