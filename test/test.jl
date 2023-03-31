cd("out")

println("Test julia package at $(pwd())\n")

"." in LOAD_PATH || push!(LOAD_PATH, ".")
"." in Base.DL_LOAD_PATH || push!(Base.DL_LOAD_PATH, ".");

using Hello
a = Hello.A("World")
say_hello(a)

println("\nTests sucessfulL!")