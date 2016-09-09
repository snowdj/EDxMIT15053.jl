
using JuMP

#Define model 
m = Model()

#Covers available
S = ["iPod", "iPhone", "iPad"]

#Non-negativity
@variable(m, x[S] >= 0)

#Production constraint (weekly)
@constraint(m, x["iPod"] + x["iPhone"] + x["iPad"] <= 40)

#Storage constraint
@constraint(m, 35 * x["iPod"] + 34.375 * x["iPhone"] + 78.75 * x["iPad"] <= 6000)

#Contract constraints
@constraint(m, 875 * x["iPod"] >= 5000)
@constraint(m, 375 * x["iPad"] >= 6000)

#Demand constraints
@constraint(m, 875 * x["iPod"] <= 6000)
@constraint(m, 625 * x["iPhone"] <= 15000)
@constraint(m, 375 * x["iPad"] <= 8000)

#Minimize cost of consumption
@objective(m, Max, 4*875*x["iPod"] + 6*625*x["iPhone"] + 10*375*x["iPad"])

#Solve the optimization problem
solve(m)

#Determine consumption amounts
println("variable values: ", getvalue(x))

#Determine optimal cost of consumption
println("Objective value: ", getobjectivevalue(m))


