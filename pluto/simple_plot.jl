### A Pluto.jl notebook ###
# v0.12.7

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ d1b3d67a-2134-11eb-37c0-31d07bf1dec8
begin
	using PlutoUI
	using Plots
	using LinearAlgebra
end

# ╔═╡ 442454c8-2135-11eb-0531-fb9566ef35a1
@bind a Slider(1:20; default=8, show_value=true)

# ╔═╡ f0f3a8be-2135-11eb-2707-7168315ff140
A = [2.1 0.1;0.3 a*0.1]

# ╔═╡ 5d6030c8-2136-11eb-0778-1702370cdde4
begin
		
			y = [det(A)^a for a in 1:20]
			plot(x = 1:20,y,size=(400,300))
		
end

# ╔═╡ Cell order:
# ╠═d1b3d67a-2134-11eb-37c0-31d07bf1dec8
# ╠═442454c8-2135-11eb-0531-fb9566ef35a1
# ╠═f0f3a8be-2135-11eb-2707-7168315ff140
# ╠═5d6030c8-2136-11eb-0778-1702370cdde4
