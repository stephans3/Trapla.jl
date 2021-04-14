@testset "Gevrey functions" begin
    
    t₀ = 0.0
    Tf = 10.0 # Final time
    Δt = 0.1  # Time discretization
    tspan = t₀ : Δt : Tf # Time span
    
    w = 1.5 # Steepness

    try
        y = pulsebell(t₀, Tf; ω = w)
        @test true
    catch
        @test false
    end

    try
        y = smoothjump(t₀, Tf; ω = w)
        @test true
    catch
        @test false
    end

    try
        y = smoothjump.(tspan, Tf; ω = w)
        @test true
    catch
        @test false
    end

end