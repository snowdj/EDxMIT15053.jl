using Plots
gr()

function f(v, x)
  sum((-v+x).^2)
end

v = [5;6;7;9;11;16;20;22;23;24;99]
x = 0.0:0.001:101.0

y = [f(v, x) for x in x];
im = indmin(y)
xm = x[im]
ym = y[im]

println("indmin =  $im, x[$im] = $xm, y[$im] = $ym")

plot(x, y)