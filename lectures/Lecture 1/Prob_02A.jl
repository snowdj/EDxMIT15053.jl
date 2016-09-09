
using JuMP

#Define model 
m = Model()

#Covers available
S = ["iPod", "iPhone", "iPad"]

#Non-negativity
@variable(m, x[S] >= 0)

#Production constraint (weekly)
@constraint(m, x["iPod"] + x["iPhone"] + x["iPad"] <= 1)

#Storage constraint
@constraint(m, 1400 * x["iPod"] + 1375 * x["iPhone"] + 3150 * x["iPad"] <= 6000)

#Contract constraints
@constraint(m, 35000 * x["iPod"] >= 5000)
@constraint(m, 15000 * x["iPad"] >= 6000)

#Demand constraints
@constraint(m, 35000 * x["iPod"] <= 6000)
@constraint(m, 25000 * x["iPhone"] <= 15000)
@constraint(m, 15000 * x["iPad"] <= 8000)

#Minimize cost of consumption
@objective(m, Max, 140000x["iPod"] + 150000x["iPhone"] + 150000x["iPad"])

#Solve the optimization problem
solve(m)

#Determine consumption amounts
println("variable values: ", getvalue(x))

#Determine optimal cost of consumption
println("Objective value: ", getobjectivevalue(m))


