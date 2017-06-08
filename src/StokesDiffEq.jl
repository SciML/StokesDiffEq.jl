__precompile__()

module StokesDiffEq

using Reexport
@reexport using DiffEqBase
import DiffEqBase: solve
import Base: size
using Parameters, VectorizedRoutines.Matlab


include("problems.jl")
include("solutions.jl")
include("stokes_solve.jl")
include("premade_problems.jl")

export solve, StokesProblem, StokesSolution, FDMMesh

export prob_stokes_homogenous, prob_stokes_dirichletzero

end # module
