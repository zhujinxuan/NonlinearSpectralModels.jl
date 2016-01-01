module NonlinearSpectralModels

# package code goes here
using Distributions

abstract NonlinearSpectralModel
abstract TruneOptions
abstract SpectralDataField

export NonlinearSpectralModel, TruneOptions, SpectralDataField
include("helpers/advections.jl")
type TruneSS <: TruneOptions 
  n_off :: Int64
end

type TruneAllS <: TruneOptions 
  n_off :: Int64
end

type TruneSV <: TruneOptions
  n_off :: Int64
end

immutable TruneNone <: TruneOptions end

export TruneSS, TruneNone,  TruneAllS, TruneSV, TruneOptions


function timegradient(  m:: NonlinearSpectralModel, x :: SpectralDataField ,TR :: TruneOptions)
  error("No function for abstract types")
end

import Base.+
import Base.-
import Base.*
import Base./

function RK4(m:: NonlinearSpectralModel, x :: SpectralDataField ,TR :: TruneOptions, dt :: Float64)
  y1 = timegradient(m,x,TR)
  y2 = timegradient(m,x+0.5*y1*dt,TR)
  y3 = timegradient(m,x+0.5*y2*dt,TR)
  y4 = timegradient(m,x+0.5*y3*dt,TR)
  return x+dt*(y1+2.0*y2+2.0*y3+y4)*(1/6.0)
end

include("Burger/model.jl")
export timegradient, RK4
end # module
