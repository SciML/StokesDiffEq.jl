type FDMMesh{X,MIN,MAX}
  Δxs::X
  mins::MIN
  maxs::MAX
  grids::Tuple
  dims::Int
  gridSize::Tuple
  square::Bool
end

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
  FDMMesh(Δxs,mins,maxs,grids,dims,gridSize,square)
end
FDMMesh(Δx::Number;mins=[0;0],maxs=[1;1],buildMesh=true) = FDMMesh(Δx*ones(mins),mins=mins,maxs=maxs,buildMesh=buildMesh)

"""
`size(mesh::FDMMesh)`

Returns `gridSize`.
"""
Base.size(mesh::FDMMesh) = mesh.gridSize

type StokesProblem{F1,F2,G,Ug,Vg,UA,VA,PA}
  f₁::F1
  f₂::F2
  g::G
  ugD::Ug
  vgD::Vg
  uanalytic::UA
  vanalytic::VA
  panalytic::PA
  trueknown::Bool
end

StokesProblem(f₁,f₂,g,uanalytic,vanalytic,panalytic) = StokesProblem(f₁,f₂,g,uanalytic,vanalytic,uanalytic,vanalytic,panalytic,true)
StokesProblem(f₁,f₂,g,ugD,vgD) = StokesProblem(f₁,f₂,g,ugD,vgD,nothing,nothing,nothing,false)
