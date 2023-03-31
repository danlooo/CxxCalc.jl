using Test

cd("out")

println("Test julia package at $(pwd())\n")

@testset "Load library" begin
    # Use local package
    "." in LOAD_PATH || push!(LOAD_PATH, ".")
    "." in Base.DL_LOAD_PATH || push!(Base.DL_LOAD_PATH, ".")
    using CxxCalc
end

@testset "Say Hello" begin
    a = CxxCalc.CxxCalculator("World")
    @test typeof(a) == CxxCalc.CxxCalculatorAllocated
    say_hello(a)
end

@testset "Arithmetics" begin
    @test CxxCalc.CxxCalculator!cxx_add(1.0, 1.0) == 2.0
    @test CxxCalc.CxxCalculator!cxx_add(1, 1) == 2
    @test CxxCalc.CxxCalculator!cxx_add(1.5, -1.5) == 0

    @test CxxCalc.CxxCalculator!cxx_subtract(1.0, 1.0) == 0
    @test CxxCalc.CxxCalculator!cxx_multiply(1.0, 1.0) == 1.0
    @test CxxCalc.CxxCalculator!cxx_divide(1.0, 2.0) == 0.5
end

println("\nTests finished!")