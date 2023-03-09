# Set up environment from .toml-files
import Pkg
Pkg.activate(".")
#Pkg.instantiate()
# Load necessary packages
using DataFrames, CSV
using JuMP
using Ipopt
using Juniper
using Cbc
using LinearAlgebra

include("TD_output.jl") # Postprocessing of solved model

wind_max = Matrix(CSV.read("TD_data/wind_max.csv", DataFrame, header=false))
solar_max = Matrix(CSV.read("TD_data/solar_max.csv", DataFrame, header=false))
Pload = Matrix(CSV.read("TD_data/load.csv", DataFrame, header=false))
#Imax = Matrix(CSV.read("TD_data/Imax_dynamic.csv", DataFrame, header=false))
Imax = Matrix(CSV.read("TD_data/Imax_static.csv", DataFrame, header=false))
#wind_max = wind_max*1.2
#solar_max = solar_max*1.2
#Pload = Pload*0.6

gen1_max = 500
gen2_max = 500
gen3_max = 500
B1 = 500
B2 = 500
B3 = 500
B4 = 500
B5 = 500
t_list = collect(1:96)
bus_list = collect(1:4)

m = Model(Ipopt.Optimizer)
# Define Variables
@variable(m, Pwind[t_list] >= 0)
@variable(m, Psolar[t_list] >= 0)
@variable(m, Pgen1[t_list] >= 0)
@variable(m, Pgen2[t_list] >= 0)
@variable(m, Pgen3[t_list] >= 0)
@variable(m, θ[bus_list,t_list])

# Add constraints
@constraint(m, λ1[t=t_list], Pwind[t]+Pgen2[t] == (θ[1,t]-θ[4,t])*B1 + (θ[1,t]-θ[2,t])*B2)
@constraint(m, λ2[t=t_list], -Pload[t] == -(θ[1,t]-θ[2,t])*B2 - (θ[3,t]-θ[2,t])*B3 - (θ[4,t]-θ[2,t])*B5)
@constraint(m, λ3[t=t_list], Psolar[t]+Pgen3[t] == (θ[3,t]-θ[2,t])*B3 + (θ[3,t]-θ[4,t])*B4)
@constraint(m, λ4[t=t_list], Pgen1[t] == (θ[4,t]-θ[1,t])*B1 + (θ[4,t]-θ[3,t])*B4 + (θ[4,t]-θ[2,t])*B5)
@constraint(m, [t=t_list], -Imax[1,t] <= (θ[1,t]-θ[4,t])*B1 <= Imax[1,t])
@constraint(m, [t=t_list], -Imax[2,t] <= (θ[2,t]-θ[1,t])*B2 <= Imax[2,t])
@constraint(m, [t=t_list], -Imax[3,t] <= (θ[3,t]-θ[2,t])*B3 <= Imax[3,t])
@constraint(m, [t=t_list], -Imax[4,t] <= (θ[4,t]-θ[3,t])*B4 <= Imax[4,t])
@constraint(m, [t=t_list], -Imax[5,t] <= (θ[4,t]-θ[2,t])*B5 <= Imax[5,t])
@constraint(m, [t=t_list], Pwind[t] <= wind_max[t])
@constraint(m, [t=t_list], Psolar[t] <= solar_max[t])
@constraint(m, [t=t_list], Pgen1[t] <= gen1_max)
@constraint(m, [t=t_list], Pgen2[t] <= gen2_max)
@constraint(m, [t=t_list], Pgen3[t] <= gen3_max)

@objective(m, Min,sum(10+5*Pgen2[t]+0.001*Pgen2[t]^2 + 50+12*Pgen3[t]+0.003*Pgen3[t]^2 + 80+15*Pgen1[t]+0.005*Pgen1[t]^2 for t in t_list))
solvetime = @elapsed optimize!(m)
status = termination_status(m)
save_results(m)
