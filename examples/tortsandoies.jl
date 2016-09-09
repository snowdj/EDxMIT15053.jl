
using JuMP

#Define model 
m = Model()

#Food available
S = ["tort","pie"]

#Non-negativity x
@variable(m, x[S] >= 0, Int)

#Minimum calories
@constraint(m, 2x["tort"] + 3x["pie"] <= 60)

#At least 6 grams of chocolate
@constraint(m, x["tort"] >= 0)

#At least 10 grams of sugar
@constraint(m, x["pie"] >= 0)

#Minimize cost of consumption
@objective(m, Max, 4x["tort"] + 5x["pie"])

#Solve the optimization problem
solve(m)

#Determine consumption amounts
println("variable values: ", getvalue(x))

#Determine optimal cost of consumption
println("Objective value: ", getobjectivevalue(m))


