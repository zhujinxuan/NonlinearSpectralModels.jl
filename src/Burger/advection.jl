type ExternalResolveBurgerSS <: ExternalAdectionResolver
  n_off :: Int64
  x :: BurgerData
end

type ExternalResolveBurgerLS <: ExternalAdectionResolver
  n_off :: Int64
  x :: BurgerData
end

type ExternalResolveBurgerSL <: ExternalAdectionResolver
  n_off :: Int64
  x :: BurgerData
end

type ExternalResolveBurgerLL <: ExternalAdectionResolver
  n_off :: Int64
  x :: BurgerData
end


export ExternalResolveBurgerLL, ExternalResolveBurgerLS, ExternalResolveBurgerSL, ExternalResolveBurgerSS

include("advectionResolves.jl")
include("advectionExternals.jl")
export advection
