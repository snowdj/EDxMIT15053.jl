
using JuMP

#Define model 
m = Model()

#Covers available
S = ["ad", "as", "ae", "bd", "bs", "be"]

#Non-negativity
@variable(m, x[S] >= 0)

#Constraint on distilate A usage
@constraint(m, x["ad"] + x["as"] + x["ae"] <= 4000)

#Constraint on distilate b usage
@constraint(m, x["bd"] + x["bs"] + x["be"] <= 5000)

#Constraint Deluxe mixture
@constraint(m, -0.15x["ad"] + 0.85x["bd"] <= 0)

#Constraint Standard mixture
@constraint(m, -0.6x["as"] + 0.4x["bs"] <= 0)

#Minimize cost of consumption
@objective(m, Max, 7.9*(x["ad"]+x["bd"])+6.9*(x["as"]+x["bs"])+5.0*(x["ae"]+x["be"])-
0.6*(x["ad"] +x["as"]+x["ae"])-0.52*(x["bd"] +x["bs"]+x["be"]))

#Solve the optimization problem
solve(m)

#Determine consumption amounts
println("variable values: ", getvalue(x))

#Determine optimal cost of consumption
println("Objective value: ", getobjectivevalue(m))


