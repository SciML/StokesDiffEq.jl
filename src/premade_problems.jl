## Stokes Examples

f₁ = (x,y)   -> zeros(x)
f₂ = (x,y)   -> zeros(x)
uanalytic = (x,y) -> 20x.*y.^3
vanalytic = (x,y) -> 5x.^4 - 5y.^4
panalytic = (x,y) -> 60x.^2 .*y - 20y.^3# + C
g = (x,y)    -> 0

"Example problem for a homogeneous stationary Stokes equation."
prob_stokes_homogenous = StokesProblem(f₁,f₂,g,uanalytic,vanalytic,panalytic)

f₁ = (x,y)   -> zeros(x)
f₂ = (x,y)   -> zeros(x)
uanalytic = (x,y) -> 0
vanalytic = (x,y) -> 0
panalytic = (x,y) -> 0
g = (x,y)    -> 0
"Example problem for solving the trivial stationary Stokes equation."
prob_stokes_dirichletzero = StokesProblem(f₁,f₂,g,uanalytic,vanalytic,panalytic)
