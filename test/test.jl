using Test

cd("out")

println("Test julia package at $(pwd())\n")

@testset "Load library" begin
    # Use local package
    "." in LOAD_PATH || push!(LOAD_PATH, ".")
    "." in Base.DL_LOAD_PATH || push!(Base.DL_LOAD_PATH, ".")
    using Hello
end

@testset "Say Hello" begin
    a = Hello.A("World")
    @test typeof(a) == Hello.AAllocated
    say_hello(a)
end

@testset "Adding" begin
    @test Hello.A!hello_add(1.0, 1.0) == 2.0
    @test Hello.A!hello_add(1, 1) == 2
    @test Hello.A!hello_add(1.5, -1.5) == 0
end

println("\nTests successful!")