
using JuMP

#Define model 
m = Model()

#Food available
S = ["brownies","ice cream","cola","cheese cake"]

#Non-negativity
@variable(m, x[S] >= 0)

#Minimum calories
@constraint(m, 400x["brownies"] + 200x["ice cream"] + 150x["cola"] + 500x["cheese cake"] >= 500)

#At least 6 grams of chocolate
@constraint(m, 3x["brownies"] + 2x["ice cream"] >= 6)

#At least 10 grams of sugar
@constraint(m, 2x["brownies"] + 2x["ice cream"] + 4x["cola"] + 4x["cheese cake"] >= 10)

#At least 8 grams of fat
@constraint(m, 2x["brownies"] + 4x["ice cream"] + 1x["cola"] + 5x["cheese cake"] >= 8)

#Minimize cost of consumption
@objective(m, Min, 0.5x["brownies"] + 0.2x["ice cream"] + 0.3x["cola"] + 0.8x["cheese cake"])

#Solve the optimization problem
solve(m)

#Determine consumption amounts
println("variable values: ", getvalue(x))

#Determine optimal cost of consumption
println("Objective value: ", getobjectivevalue(m))


