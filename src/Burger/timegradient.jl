include("advection.jl")
function timegradient(  m:: BurgerModel, x :: BurgerData ,TR :: TruneNone)
  xx = x.x
  diffusion =  - m.d * ([1:x.n;]).^2 .* xx
  advectionLL = advection(m, x, ResolveLL(x.n))

  return BurgerData(x.n,diffusion + advectionLL)
end

function timegradient( m :: BurgerModel, x:: BurgerData, TR :: TruneAllS )
  xx = x.x
  diffusion =  - m.d * ([1:x.n;]).^2 .* xx
  advectionLL = advection(m, x, ResolveLL(TR.n_off))

  return BurgerData(x.n,diffusion + advectionLL)
end

function timegradient( m :: BurgerModel, x:: BurgerData, TR :: TruneSS )
  xx = x.x
  diffusion =  - m.d * ([1:x.n;]).^2 .* xx
  advectionLL = advection(m, x, ResolveLL(TR.n_off))
  advectionSS = advection(m, x, ResolveSS(TR.n_off))
  
  return BurgerData(x.n,diffusion + advectionLL + advectionSS)
end

function timegradient( m :: BurgerModel, x:: BurgerData, TR :: TruneSV )
  xx = x.x
  diffusion =  - m.d * ([1:x.n;]).^2 .* xx
  advectionLL = advection(m, x, ResolveLL(TR.n_off))
  advectionLS = advection(m, x, ResolveLS(TR.n_off))
  advectionSL = advection(m, x, ResolveSL(TR.n_off))

  return BurgerData(x.n,diffusion + advectionLL + advectionSL + advectionLS)
end

function timegradient( m :: BurgerModel, x:: BurgerData, TR :: TruneExternalBurgerSS )
  xx = x.x
  diffusion =  - m.d * ([1:x.n;]).^2 .* xx
  advectionLL = advection(m, x, ResolveLL(TR.n_off))
  advectionSS = advection(m,x, ExternalResolveBurgerSS(TR.n_off, TR.x))

  return BurgerData(x.n,diffusion + advectionLL + advectionSS)
end

function timegradient( m :: BurgerModel, x:: BurgerData, TR :: TruneExternalBurgerSV )
  xx = x.x
  diffusion =  - m.d * ([1:x.n;]).^2 .* xx
  advectionLL = advection(m, x, ResolveLL(TR.n_off))
  advectionLS = advection(m,x, ExternalResolveBurgerLS(TR.n_off, TR.x))
  advectionSL = advection(m,x, ExternalResolveBurgerSL(TR.n_off, TR.x))

  return BurgerData(x.n,diffusion + advectionLL + advectionSL + advectionLS)
end

function timegradient( m :: BurgerModel, x:: BurgerData, TR :: TruneExternalBurgerSVSS )
  xx = x.x
  diffusion =  - m.d * ([1:x.n;]).^2 .* xx
  advectionLL = advection(m, x, ResolveLL(TR.n_off))
  advectionSS = advection(m,x, ExternalResolveBurgerSS(TR.n_off, TR.x))
  advectionLS = advection(m,x, ExternalResolveBurgerLS(TR.n_off, TR.x))
  advectionSL = advection(m,x, ExternalResolveBurgerSL(TR.n_off, TR.x))
  return BurgerData(x.n,diffusion + advectionLL + advectionSL + advectionLS + advectionSS)
end

function timegradient( m :: BurgerModel, x:: BurgerData, TR :: TruneExternalBurgerSSDynamicSV)
  xx = x.x
  diffusion =  - m.d * ([1:x.n;]).^2 .* xx
  advectionLL = advection(m, x, ResolveLL(TR.n_off))
  advectionSS = advection(m,x, ExternalResolveBurgerSS(TR.n_off, TR.x))
  advectionLS = advection(m, x, ResolveLS(TR.n_off))
  advectionSL = advection(m, x, ResolveSL(TR.n_off))
  return BurgerData(x.n,diffusion + advectionLL + advectionSL + advectionLS + advectionSS)
end


export timegradient
