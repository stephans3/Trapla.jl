@testset "Sampled signals" begin
    
    t = 0.1;  # actual time
    T = 1.0;  # sampling time
    indx = 1; # index
    param = [1.0, 2.0, 3.0, 4.0, 5.0]


    try
        y = pulse(t/T, indx; power=10)
        @test true
    catch
        @test false
    end

    try
        y = signal(t :: Real, T :: Real, param)
        @test true
    catch
        @test false
    end

end