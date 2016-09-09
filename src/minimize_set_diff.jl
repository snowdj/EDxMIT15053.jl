using JuMP, Combinatorics

# Just usable for toy arrays, say length(v) < 11, otherwise will run out of memory

function minimize_set_diff(v::Array{Int})
  N = length(v)
  local d = sum(v)
  local tup = (d, v, Int[])
  local mininset, minnotinset
  if length(v) < 2
    println("v too small.")
    return(tup)
  end
  perms = collect(permutations(v))
  println("length(perms) = $(length(perms))")
  for perm in perms
    for i in 1:N-1
      #println("perm = $perm, i = $i")
      inset = perm[1:i]
      notinset = perm[(i+1):N]
      if d > abs(sum(inset) - sum(notinset))
        mininset = inset
        minnotinset = notinset
        d = abs(sum(inset) - sum(notinset))
      end
    end
  end
  
  return((d, Set(sort(mininset)), Set(sort(minnotinset))))
end

v = [1;2;4;8;16;32]    
d, mis, mnis = minimize_set_diff(v)
