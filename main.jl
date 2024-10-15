using Printf
include("src/utils.jl")
include("src/union_set_algorithm.jl")


# Parameters
unionset::UnionSet = UnionSet(Int32(2), Int32(500), Int32(500))
const epsilon::Float32 = 1 / 100
const delta::Float32 = 1 / 100


h::Float32 = approximate_union_set(unionset, epsilon = epsilon, delta = delta)
println("approximation h = $h")
