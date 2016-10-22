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
type StokesSolution <: DESolution
  u
  v
  p
  u_analytic
  vTrue
  pTrue
  mesh::FDMMesh
  trueknown::Bool
  errors
  converrors
  StokesSolution(u,v,p,u_analytic,vTrue,pTrue,mesh,trueknown;errors=nothing,converrors=nothing) = new(u,v,p,u_analytic,vTrue,pTrue,mesh,trueknown,errors,converrors)
end
