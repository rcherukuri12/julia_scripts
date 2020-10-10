#cuda examples
using CUDA, Test, CUDA.CUFFT
function pi_gpu(n)
    4 * sum( CURAND(Float64, n).^2 .+ CURAND(Float64,n).^2 <= 1) / n
end

b = copy(a)
fill!(b, 0)
@btime b == CUDA.zeros(Int, 1024)

a = CUDA.rand(2,2)
map(sin, a)
@show fft(a)
