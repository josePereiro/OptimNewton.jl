using OptimNewton
using Test

@testset "OptimNewton.jl" begin
    # get_root.
    # x0 = pi/10, f(x) = sin(x), fd(x) = cos(x).
    @test isapprox(get_root(pi/10, x -> sin(x), x -> cos(x)), 0.0);
    # x0 = 1, f(x) = 2 - x^2 + x^3, fd(x) = -2x + 3x^2.
    @test isapprox(get_root(1, x -> 2 - x^2 + x^3, x -> -2x + 3x^2),-1);

    # optimize
    # x0 = pi/3, f(x) = sin(x), fd(x) = cos(x), sd(x) = -sin(x)
    @test isapprox(optimize(pi/3, x -> sin(x), x -> cos(x), x -> -sin(x)), pi/2);
    # x0 = 1, f(x) = 2 - x^2 + x^3, fd(x) = -2x + 3x^2, sd(x) = -2 + 6x.
    @test isapprox(optimize(1, x -> 2 - x^2 + x^3, x -> -2x + 3x^2, x -> -2 + 6x),2/3);
 end
