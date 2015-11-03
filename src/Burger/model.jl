
type BurgerModel <: NonlinearSpectralModel
  d :: Float64
end

type BurgerData <: SpectralDataField
  n :: Int64
  x :: Array{Float64,2}
end

export BurgerModel, BurgerData, 
include("trunes.jl")

include("timegradient.jl")

function +(x:: BurgerData, y :: BurgerData) 
  BurgerData(x.n,x.x+y.x) 
end
function *(x:: BurgerData, y :: Float64) 
  BurgerData(x.n,x.x*y) 
end
function *(y :: Float64,x:: BurgerData ) 
  BurgerData(x.n,x.x*y) 
end
