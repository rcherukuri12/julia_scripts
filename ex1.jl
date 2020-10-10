#example showing fixing unstable code.
using Base64, Statistics, Profile
function my_pos2(x)
    if x < 0
        return zero(x)
    else
        return x
    end
end
