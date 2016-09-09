
using JuMP

#Define model 
m = Model()

#Covers available
S = ["iPod", "iPhone", "total"]

#Non-negativity and productivity constraints
@variable(m, x[S] >= 0)
@constraint(m, x["total"] <= 40)

#Storage constraint
@constraint(m, 35x["iPod"] + 34.375x["iPhone"] + 78.75*(x["total"]-x["iPod"]-x["iPhone"]) <= 6000)

#Contract constraints
@constraint(m, 875x["iPod"] >= 5000)
@constraint(m, 375*(x["total"]-x["iPod"]-x["iPhone"]) >= 6000)

#Demand constraints
@constraint(m, 875x["iPod"] <= 6000)
@constraint(m, 625x["iPhone"] <= 15000)
@constraint(m, 375*(x["total"]-x["iPod"]-x["iPhone"]) <= 8000)

#Minimize cost of consumption
@objective(m, Max, 4*875x["iPod"] + 6*625x["iPhone"] + 10*375(x["total"]-x["iPod"]-x["iPhone"]))

#Solve the optimization problem
solve(m)

#Determine consumption amounts
println("variable values: ", getvalue(x))

#Determine optimal cost of consumption
println("Objective value: ", getobjectivevalue(m))


