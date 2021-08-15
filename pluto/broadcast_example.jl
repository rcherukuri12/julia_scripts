### A Pluto.jl notebook ###
# v0.15.1

using Markdown
using InteractiveUtils

# ╔═╡ d8c412e6-aebd-4241-8337-73297d5eca2a
using Base64

# ╔═╡ e0463b78-fde9-11eb-3119-1dc8ba96c237
# this example shows the 'Base' broadcast use and pass by reference
a = rand(1:10, 10)

# ╔═╡ cb5ad7a1-61eb-4228-9b91-80ccf89ed5b5
function add_one!(a::Array{Int64})
    a .= a .+ 1
end

# ╔═╡ d60809d5-d9fc-4ae7-ac8d-1a0c817dcbb3
add_one!(a)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Base64 = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.0-beta3"
manifest_format = "2.0"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"
"""

# ╔═╡ Cell order:
# ╠═d8c412e6-aebd-4241-8337-73297d5eca2a
# ╠═e0463b78-fde9-11eb-3119-1dc8ba96c237
# ╠═cb5ad7a1-61eb-4228-9b91-80ccf89ed5b5
# ╠═d60809d5-d9fc-4ae7-ac8d-1a0c817dcbb3
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
