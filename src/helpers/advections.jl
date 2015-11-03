abstract AdevectionsSolver

type ResolveLL <: AdevectionsSolver
  n_off :: Int64
end

type ResolveLS <: AdevectionsSolver
  n_off :: Int64
end

type ResolveSL  <: AdevectionsSolver
  n_off :: Int64
end

type ResolveSS <: AdevectionsSolver
  n_off :: Int64
end

export ResolveSL, ResolveSS, ResolveLL , ResolveLS, AdevectionsSolver
export ExternalAdectionResolver
abstract ExternalAdectionResolver <: AdevectionsSolver
function advection(  m:: NonlinearSpectralModel, x :: SpectralDataField ,TR :: AdevectionsSolver)
  error("No function for abstract types")
end
export advection
