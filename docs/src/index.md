```@meta
CurrentModule = Trapla
```

# Overview

Trapla is a Julia package to design feed-forward control laws. At the moment only one method using [Gevrey functions as described on Wikipedia](https://en.wikipedia.org/wiki/Gevrey_class) is implemented.


## Example

A steepness coefficient ``\omega = 3`` and a final time ``T = 10`` is considered.

```julia
using Trapla

T = 10.0;
tspan = 0. : 0.1 : 10.;

y = smoothjump.(tspan, T; ω = 3.0)
# output
101-element Vector{Float64}:
 0.0
 0.0
 0.0
 0.0
 0.0
 0.0
 0.0
 0.0
 0.0
 0.0
 0.0
 ⋮
 0.9999999999999984
 1.000000000000004
 0.9999999999999967
 0.9999999999999989
 1.0000000000000056
 1.0000000000000016
 1.0000000000000033
 1.0000000000000038
 0.9999999999999967
 1.0000000000000002
 1.0
```
