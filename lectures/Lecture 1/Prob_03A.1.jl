
using JuMP

#Define model 
m = Model()

#Covers available
S = ["1", "2", "w"]

#Non-negativity
@variable(m, -3 <= x[S] <= 3)

#Definition of w
@constraint(m, x["w"] >= 2.3x["1"] + x["2"])
@constraint(m, x["w"] >= 4.3x["1"] - 0.5x["2"])

#Constraint 1
@constraint(m, 0.5x["1"] <= 0.5x["2"])

#Constraint 2
@constraint(m, 10x["1"] + 28x["2"] == 64)

#Constraint 3
@constraint(m, x["1"] + x["2"] >= 1)

#Minimize cost of consumption
@objective(m, Min, x["w"])

#Solve the optimization problem
solve(m)

#Determine consumption amounts
println("variable values: ", getvalue(x))

#Determine optimal cost of consumption
println("Objective value: ", getobjectivevalue(m))


