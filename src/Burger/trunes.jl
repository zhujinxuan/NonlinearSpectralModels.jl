
type TruneExternalBurgerSS <: TruneOptions
  n_off :: Int64
  x :: BurgerData
end

type TruneExternalBurgerSV <: TruneOptions
  n_off :: Int64
  x :: BurgerData
end

type TruneExternalBurgerSVSS <: TruneOptions
  n_off :: Int64
  x :: BurgerData
end

type TruneBurgerExternalSSDynamicLS <: TruneOptions
  n_off :: Int64
  x :: BurgerData
end

export TruneExternalBurgerSS, TruneExternalBurgerSV, TruneExternalBurgerSVSS, TruneBurgerExternalSSDynamicLS
