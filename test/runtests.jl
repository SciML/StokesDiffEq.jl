using StokesDiffEq
using Base.Test

##Stokes
println("Stokes Tests")
@time @test include("stokes/stokes_tests.jl")
println("DGS Internals Test")
@time @test include("stokes/stokes_dgs_tests.jl")
