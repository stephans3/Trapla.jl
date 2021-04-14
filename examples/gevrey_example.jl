using Trapla

Tf = 10.0 # Final time
Δt = 0.1  # Time discretization
tspan = 0.0 : Δt : Tf # Time span

w = 1.5 # Steepness

y = smoothjump.(tspan, Tf; ω = w); # Planned trajectory

# using Plots
# plot(tspan, y)
