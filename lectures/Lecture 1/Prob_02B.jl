
using JuMP

#Define model 
m = Model()

#Covers available
S = ["iPod", "iPhone", "iPad"]

#Non-negativity
@variable(m, x[S] >= 0)

#Production constraint (weekly)
@constraint(m, 1/7000 * x["iPod"] + 1/5000 * x["iPhone"] + 1/3000 * x["iPad"] <= 5)

#Storage constraint
@constraint(m, 40/1000 * x["iPod"] + 55/1000 * x["iPhone"] + 210/1000 * x["iPad"]<= 6000)

#Contract constraints
@constraint(m, x["iPod"] >= 5000)
@constraint(m, x["iPad"] >= 6000)

#Demand constraints
@constraint(m, x["iPod"] <= 6000)
@constraint(m, x["iPhone"] <= 15000)
@constraint(m, x["iPad"] <= 8000)

#Minimize cost of consumption
@objective(m, Max, 4x["iPod"] + 6x["iPhone"] + 10x["iPad"])

#Solve the optimization problem
solve(m)

#Determine consumption amounts
println("variable values: ", getvalue(x))

#Determine optimal cost of consumption
println("Objective value: ", getobjectivevalue(m))


