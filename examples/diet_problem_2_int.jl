
using JuMP

#Define model 
m = Model()

#Foods available
S = ["h", "lh", "c", "s", "f"]

#Non-negativity
@variable(m, x[S] >= 0, Int)

#Between 600 and 900 calories
@constraint(m, 250x["h"] + 770x["lh"] + 360x["c"] + 190x["s"] + 230x["f"] >= 600)
@constraint(m, 250x["h"] + 770x["lh"] + 360x["c"] + 190x["s"] + 230x["f"] <= 900)

#Less than 50% of daily sodium
@constraint(m, 480x["h"] + 1170x["lh"] + 800x["c"] + 580x["s"] + 160x["f"] <= 0.5*2300)

#At least 30 grams of protein
@constraint(m, 30x["h"] + 45x["lh"] + 15x["c"] + 25x["s"] + 3x["f"] >= 30)

#At most 40% of the calories is from fat
@constraint(m, 80x["h"] + 360x["lh"] + 145x["c"] + 45x["s"] + 100x["f"] -
  0.4*(250x["h"] + 770x["lh"] + 360x["c"] + 190x["s"] + 230x["f"])<= 0)

#Minimize cost of consumption
@objective(m, Min, 1.0x["h"] + 3.0x["lh"] + 2.50x["c"] + 3.0x["s"] + 1.0x["f"])

#Solve the optimization problem
solve(m)

#Determine consumption amounts
println("variable values: ", getvalue(x))

#Determine optimal cost of consumption
println("Objective value: ", getobjectivevalue(m))


