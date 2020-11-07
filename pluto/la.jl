### A Pluto.jl notebook ###
# v0.12.6

using Markdown
using InteractiveUtils

# ╔═╡ af957aaa-1cb9-11eb-1eb9-6bf4907a1628
using LinearAlgebra

# ╔═╡ 2572e992-1cba-11eb-3315-1f132089db17
A = [10 2;3 4]

# ╔═╡ 35f6a224-1cba-11eb-0e07-c9c4b43619b8
det(A)

# ╔═╡ 5ef57da4-1cba-11eb-12ae-8bd131d32935
tr(A)

# ╔═╡ 9bc6985a-1cba-11eb-3836-c314153cc1cd
inv(A)

# ╔═╡ ad81fcd8-1cba-11eb-2a91-af2cfbc9cc73
eigvals(A)

# ╔═╡ db9c32d2-1cba-11eb-36fd-4db5d1ed8a9c
eigvecs(A)

# ╔═╡ 97dfd928-1cbb-11eb-2858-2f5a079ee685
factorize(A)

# ╔═╡ d36a84b4-1cbb-11eb-1884-b7165e7741b3
Symmetric(A)

# ╔═╡ eba461d0-1cbb-11eb-042a-6f6d85b8f6e6
Diagonal(A)

# ╔═╡ f59c977a-1cbb-11eb-1a8a-17f77b281e40
Tridiagonal(A)

# ╔═╡ 1387ed2a-1cbc-11eb-1d9b-ed159167d81f
svd(A)

# ╔═╡ 6ffbd562-1cbc-11eb-37ab-d368cb70fe31
qr(A)

# ╔═╡ 86c0ffa2-1cbc-11eb-3f90-8fe517e4a514
eigen(A)

# ╔═╡ f3f9a022-1cbe-11eb-37b9-392a6bd21c8d
rank(A)

# ╔═╡ fd489688-1cbe-11eb-19f0-83313a3c4f0d
A*A

# ╔═╡ 3e1faae8-1cbf-11eb-11b7-a7f3ce3b43c1
A.*A

# ╔═╡ Cell order:
# ╠═af957aaa-1cb9-11eb-1eb9-6bf4907a1628
# ╠═2572e992-1cba-11eb-3315-1f132089db17
# ╠═35f6a224-1cba-11eb-0e07-c9c4b43619b8
# ╠═5ef57da4-1cba-11eb-12ae-8bd131d32935
# ╠═9bc6985a-1cba-11eb-3836-c314153cc1cd
# ╠═ad81fcd8-1cba-11eb-2a91-af2cfbc9cc73
# ╠═db9c32d2-1cba-11eb-36fd-4db5d1ed8a9c
# ╠═97dfd928-1cbb-11eb-2858-2f5a079ee685
# ╠═d36a84b4-1cbb-11eb-1884-b7165e7741b3
# ╠═eba461d0-1cbb-11eb-042a-6f6d85b8f6e6
# ╠═f59c977a-1cbb-11eb-1a8a-17f77b281e40
# ╠═1387ed2a-1cbc-11eb-1d9b-ed159167d81f
# ╠═6ffbd562-1cbc-11eb-37ab-d368cb70fe31
# ╠═86c0ffa2-1cbc-11eb-3f90-8fe517e4a514
# ╠═f3f9a022-1cbe-11eb-37b9-392a6bd21c8d
# ╠═fd489688-1cbe-11eb-19f0-83313a3c4f0d
# ╠═3e1faae8-1cbf-11eb-11b7-a7f3ce3b43c1
