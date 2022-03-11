##### Neu überarbeiten #######


"""
    pulse(t :: Real, a :: Real; power=100)

Approximated unit step 

The step is assumed in interval (0,1)

`t` - actual time

`i` - shifting index 

`power` - accuracy of step approximation

"""
function pulse(t :: Real, i :: Real; power=100)

    exp(-(2 * (t - (i - 0.5)) )^(2*power) )
end


"""
    signal(t :: Real, T :: Real, p :: Vector{T} where T <: Real)

Signal of unit steps

`t` - actual time

`T` - sampling time

`p` - parameter vector containing the scaling coefficients

"""
function signal(t :: Real, T :: Real, p :: Vector{T} where T <: Real)

    s = 0.0;

    for i = 1 : length(p)
        time_signal = t/T
        s += p[i] * pulse(time_signal, i)
    end

    return s
end
