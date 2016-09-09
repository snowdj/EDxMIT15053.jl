
using JuMP

#Define model 
m = Model()

#Covers available
S = ["1", "2", "w"]

#Define variables
@variable(m, x[S])

#Non-nagativity constraint on x["1"]
@constraint(m, 0 <= x["1"] <= 3)

#Definition of w
@constraint(m, x["w"] <= 0.8x["1"] + 0.9x["2"])
@constraint(m, x["w"] >= -0.8x["1"] - 0.9x["2"])

#Constraint 1
@constraint(m, 0.9x["1"] + 1.2x["2"] <= 10)
@constraint(m, -0.9x["1"] - 1.2x["2"] >= -10)

#Minimize cost of consumption
@objective(m, Max, x["w"])

#Solve the optimization problem
solve(m)

#Determine consumption amounts
println("variable values: ", getvalue(x))

#Determine optimal cost of consumption
println("Objective value: ", getobjectivevalue(m))


