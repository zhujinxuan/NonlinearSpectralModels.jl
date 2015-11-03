function advection(  m:: BurgerModel, x :: BurgerData , AD :: ExternalResolveBurgerLL)
  x1 = AD.x
  xx = x1.x
  n_off = AD.n_off
  result = zeros(xx)
  for ii = 1:n_off
    for kk = 1:n_off
      cross_iikk = -0.5*xx[ii,:] .*xx[kk,:]*kk
      if (ii + kk <= x.n ) 
        result[ii+kk,:] += cross_iikk 
      end
      if (ii - kk > 0 ) 
        result[ii-kk,:] += cross_iikk
      elseif (ii - kk < 0 )
        result[kk-ii,:] -= cross_iikk
      end
    end
  end
  return result
end

function advection(  m:: BurgerModel, x :: BurgerData , AD :: ExternalResolveBurgerSS)
  x1 = AD.x
  xx = x1.x
  n_off = AD.n_off
  result = zeros(xx)
  for ii = (1+n_off):x.n
    for kk = (1+n_off):x.n
      cross_iikk = -0.5*xx[ii,:] .*xx[kk,:]*kk
      if (ii + kk <= x.n ) 
        result[ii+kk,:] += cross_iikk 
      end
      if (ii - kk > 0 ) 
        result[ii-kk,:] += cross_iikk
      elseif (ii - kk < 0 )
        result[kk-ii,:] -= cross_iikk
      end
    end
  end
  return result
end

function advection(  m:: BurgerModel, x :: BurgerData , AD :: ExternalResolveBurgerLS)
  xx= x.x
  eX = AD.x
  eXX = eX.x
  n_off = AD.n_off
  result = zeros(xx)
  for ii = 1:n_off
    for kk = (1+n_off):x.n
      cross_iikk = -0.5*xx[ii,:] .* eXX[kk,:]*kk
      if (ii + kk <= x.n ) 
        result[ii+kk,:] += cross_iikk 
      end
      if (ii - kk > 0 ) 
        result[ii-kk,:] += cross_iikk
      elseif (ii - kk < 0 )
        result[kk-ii,:] -= cross_iikk
      end
    end
  end
  return result
end

function advection(  m:: BurgerModel, x :: BurgerData , AD :: ExternalResolveBurgerSL)
  xx= x.x
  eX = AD.x
  eXX = eX.x
  n_off = AD.n_off
  result = zeros(xx)
  for ii = 1:n_off
    for kk = (1+n_off):x.n
      cross_iikk = -0.5*xx[ii,:] .*eXX[kk,:]*ii
      if (ii + kk <= x.n ) 
        result[ii+kk,:] += cross_iikk 
      end
      if (ii - kk > 0 ) 
        result[ii-kk,:] -= cross_iikk
      elseif (ii - kk < 0 )
        result[kk-ii,:] += cross_iikk
      end
    end
  end
  return result
end



