
function advection(  m:: BurgerModel, x :: BurgerData , AD :: ResolveLL)
  xx= x.x
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

function advection(  m:: BurgerModel, x :: BurgerData , AD :: ResolveSS)
  xx= x.x
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

function advection(  m:: BurgerModel, x :: BurgerData , AD :: ResolveLS)
  xx= x.x
  n_off = AD.n_off
  result = zeros(xx)
  for ii = 1:n_off
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

function advection(  m:: BurgerModel, x :: BurgerData , AD :: ResolveSL)
  xx= x.x
  n_off = AD.n_off
  result = zeros(xx)
  for ii = 1:n_off
    for kk = (1+n_off):x.n
      cross_iikk = -0.5*xx[ii,:] .*xx[kk,:]*ii
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


