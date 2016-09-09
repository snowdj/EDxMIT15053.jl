using Plots
gr()

function f(x, y1, c1, x2, y2, c2)
  sqrt(y1^2 + x^2)/c1 + sqrt((x2-x)^2 + y2^2)/c2
end

x = 4.0:0.001:6.0
y = [f(x, 4.0, 1.0, 8.0, -4.0, 0.8) for x in x];
im = indmin(y)
xm = x[im]
ym = y[im]

println("indmin =  $im, x[$im] = $xm, y[$im] = $ym")

plot(x, y)