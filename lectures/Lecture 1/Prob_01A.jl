using Plots
gr()

function f(x, y1, x2, y2)
  sqrt(y1^2 + x^2) + sqrt((x2-x)^2 + y2^2)
end

x = 5.0:0.001:6.0
y = [f(x, 5.0, 8.0, 2.0) for x in x];
im = indmin(y)
xm = x[im]
ym = y[im]

println("indmin =  $im, x[$im] = $xm, y[$im] = $ym")

plot(x, y)