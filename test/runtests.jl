using StokesDiffEq
using Base.Test

const TEST_PLOT = false

##Stokes
println("Stokes Tests")
@time @test include("stokes/stokes_tests.jl")
println("DGS Internals Test")
@time @test include("stokes/stokes_dgs_tests.jl")
