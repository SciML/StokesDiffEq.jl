type FDMMesh
  Δxs::AbstractArray
  mins::AbstractArray
  maxs::AbstractArray
  grids::Tuple
  dims::Int
  gridSize::Tuple
  square::Bool
  function FDMMesh(Δxs::AbstractArray;mins=[0;0],maxs=[1;1],buildMesh=true)
    if length(mins)!=length(maxs) || length(Δxs)!=length(mins) error("DimensionMismatch") end
    dims = length(mins)
    if buildMesh && dims == 2
      grids = meshgrid(mins[1]:Δxs[1]:maxs[1],mins[2]:Δxs[2]:maxs[2])
      gridSize = size(grids[1])
    elseif buildMesh && dims == 3
      grids = meshgrid(mins[1]:Δxs[1]:maxs[1],mins[2]:Δxs[2]:maxs[2],mins[3]:Δxs[3]:maxs[3])
      gridSize = size(grids[1])
    else
      grids = nothing
      gridSize = (maxs-mins)./Δxs
    end
    square = minimum(map((x)->(x == gridSize[1]),gridSize))
    new(Δxs,mins,maxs,grids,dims,gridSize,square)
  end
  FDMMesh(Δx::Number;mins=[0;0],maxs=[1;1],buildMesh=true) = FDMMesh(Δx*ones(mins),mins=mins,maxs=maxs,buildMesh=buildMesh)
end

"""
`size(mesh::FDMMesh)`

Returns `gridSize`.
"""
size(mesh::FDMMesh) = mesh.gridSize

type StokesProblem
  f₁#::Function
  f₂#::Function
  g#::Function
  ugD#::Function
  vgD#::Function
  uanalytic#::Function
  vanalytic#::Function
  panalytic#::Function
  trueknown::Bool
  StokesProblem(f₁,f₂,g,uanalytic,vanalytic,panalytic) = new(f₁,f₂,g,uanalytic,vanalytic,uanalytic,vanalytic,panalytic,true)
  StokesProblem(f₁,f₂,g,ugD,vgD) = new(f₁,f₂,g,ugD,vgD,nothing,nothing,nothing,false)
end
