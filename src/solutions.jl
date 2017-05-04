"""
`StokesSolution`

Holds the data for the solution to a Stokes problem.

### Fields

* u
* v
* p
* u_analytic
* vTrue
* pTrue
* mesh
* trueknown
* errors
* converrors

"""
type StokesSolution{T,N,U,V,P,E,C} <: AbstractNoTimeSolution{T,N}
  u::Array{T,N}
  v::Array{T,N}
  p::Array{T,N}
  u_analytic::U
  vTrue::V
  pTrue::P
  mesh::FDMMesh
  trueknown::Bool
  errors::E
  converrors::C
end

  StokesSolution(u,v,p,u_analytic,vTrue,pTrue,mesh,trueknown;errors=nothing,converrors=nothing) =
  StokesSolution(u,v,p,u_analytic,vTrue,pTrue,mesh,trueknown,errors,converrors)
