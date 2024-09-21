"""Create a set of integers between 0 and typemax(Int32), given a precardinal"""
struct IntSet
	card::Int32
	values::Set{Int32}
end

function IntSet(pc::Int32)
	v::Set{Int32} = Set(rand(0:typemax(Int32), pc))
	c::Int32 = convert(Int32, length(v))
	return IntSet(c, v)
end

function IntSet(pc::Int32, max_val::Int32)
	v::Set{Int32} = Set(rand(0:max_val, pc))
	c::Int32 = convert(Int32, length(v))
	return IntSet(c, v)
end

"""Create a union of IntSet"""
struct UnionSet
	m::Int32
	pc::Int32
	sets::Array{IntSet}
end

function UnionSet(m::Int32, pc::Int32)
	sets::Array{IntSet} = [IntSet(pc) for _ in 1:m]
	println("Union of $m sets of precardinal $pc is created")
	return UnionSet(m, pc, sets)
end

function UnionSet(m::Int32, pc::Int32, max_val::Int32)
	sets::Array{IntSet} = [IntSet(pc, max_val) for _ in 1:m]
	println("Union of $m sets of precardinal $pc is created")
	return UnionSet(m, pc, sets)
end

"""Computes the ratio of the cardinal of each set of the union over the sum of the cardinals of the sets in the union"""
function cardinal_ratios(unionset::UnionSet)::Array{Float32}
	cardinals::Array{Int32} = [set.card for set in unionset.sets]
	return convert(Array{Float32}, cardinals ./ sum(cardinals))
end
