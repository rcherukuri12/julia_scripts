### A Pluto.jl notebook ###
# v0.12.7

using Markdown
using InteractiveUtils

# ╔═╡ 55518988-20c3-11eb-02b0-375c3504f7b1
#this notebook shows Julia type hierarchy

# ╔═╡ dd424284-20c0-11eb-344a-9b14b7570882
begin
	abstract type Asset end;
	abstract type Property <:Asset end;
	abstract type Investment <:Asset end;
	abstract type Cash <: Asset end;
	abstract type Equity <: Investment end;
end

# ╔═╡ 6b99fad0-20c2-11eb-18c3-7511057eef2a
@show subtypes(Asset)

# ╔═╡ ae14a644-20c2-11eb-00ea-5f8ed7d5a6b7
@show supertype(Cash)

# ╔═╡ e9b32cde-20c2-11eb-3903-e765cac8b0f0
@show supertype(Equity)

# ╔═╡ 0a79941e-20c3-11eb-0f77-7b28e2b48560
@show subtypes(Investment)

# ╔═╡ Cell order:
# ╠═55518988-20c3-11eb-02b0-375c3504f7b1
# ╠═dd424284-20c0-11eb-344a-9b14b7570882
# ╠═6b99fad0-20c2-11eb-18c3-7511057eef2a
# ╠═ae14a644-20c2-11eb-00ea-5f8ed7d5a6b7
# ╠═e9b32cde-20c2-11eb-3903-e765cac8b0f0
# ╠═0a79941e-20c3-11eb-0f77-7b28e2b48560
