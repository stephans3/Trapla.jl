using Trapla

Tf = 10.0 # Final time
Δt = 0.1  # Time discretization
tspan = 0.0 : Δt : Tf # Time span

w = 1.5 # Steepness

y = smoothjump.(tspan, Tf; ω = w); # Planned trajectory

ygk = smoothjump_quadgk.(tspan, Tf; ω = w)

using Plots
plot(tspan, y)


import ForwardDiff
fn(t) = smoothjump(t, Tf; ω = w);
dfn = x -> ForwardDiff.derivative(fn,x)
d2fn = x -> ForwardDiff.derivative(dfn,x)

d2fn(6)