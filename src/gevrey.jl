"""
Smooth jump function ``\\Phi_{\\omega, T}(t)``

    Returns a planned trajectory.

    smoothjump(t :: Real, T:: Real; ω = 2.0 :: Real)

`t` : actual time

`T` : final time

`ω` : steepness factor of trajectory
"""
function smoothjump(t :: Real, T:: Real; ω = 2.0 :: Real)

    if t <= 0
        return  0.0
    elseif t >= T
        return 1.0
    else
        x,w = FastGaussQuadrature.gausslegendre(1000)
        p1 = t/2;
        p2 = T/2;
        f(v) = pulsebell(v, T, ω=ω)
        numer = p1 * FastGaussQuadrature.dot(w,f.(p1*x .+ p1))
        denom = p2 * FastGaussQuadrature.dot(w,f.(p2*x .+ p2))

        return numer/denom
    end
end

function smoothjump_quadgk(t :: Real, T:: Real; ω = 2.0 :: Real)

    if t <= 0
        return  0.0
    elseif t >= T
        return 1.0
    else

        numer, err1 = QuadGK.quadgk(x-> pulsebell(x, T, ω=ω), 0, t)
        denom, err2 = QuadGK.quadgk(x-> pulsebell(x, T, ω=ω), 0, T)

        return numer/denom
    end
end


"""
Bell-shaped pulse function ``\\Omega_{\\omega, T}(t)``

`t` : actual time

`T` : final time

`ω` : steepness factor of trajectory
"""
function pulsebell(t :: Real, T:: Real; ω = 2.0 :: Real)

    if t < 0 || t > T
        return 0
    else
        exp( -1 / ( (1 - t/T)*(t/T))^ω )
    end

end