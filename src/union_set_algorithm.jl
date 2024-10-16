using Printf
using Statistics
using Distributions
include("utils.jl")


function approximate_union_set(unionset::UnionSet; epsilon::Float32, delta::Float32, verbose::Bool = true)::Float32
	X::Int32 = 0
	N::Int32 = round(3 * unionset.m * log(2 / delta) / epsilon^2)
	if verbose
		println("Starting approximation of union sets, with N = $N")
	end
	distribution = Categorical(cardinal_ratios(unionset))
	for _ in 1:N
		i = rand(distribution)
		set_i = unionset.sets[i]
		x = collect(set_i.values)[rand(1:set_i.card)]
		is_present::Bool = false
		for j in 1:i-1
			if x in unionset.sets[j].values
				is_present = true
				break
			end
		end
		if !is_present
			X += 1
		end
	end
	return X * sum([set.card for set in unionset.sets]) / N
end
