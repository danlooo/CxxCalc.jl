# CxxCalc.jl: A C++ Calculator Library with Julia Bindings

[![CI](https://github.com/danlooo/CxxCalc.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/danlooo/CxxCalc.jl/actions/workflows/CI.yml)

<img src="logo.svg" align="right" style="padding-left:10px;" width="150"/>

The main goal of this project is to demonstrate the direct access of C++ library functions and types within Julia.
CxxCalc.jl is a basic calculator libray written in C++.
The CI/CD pipeline will automatically create a Julia package from that C++ library code to access the C++ functions in Julia using pointers instead of system calls.

## Get Started

[Earthly](https://earthly.dev/) is used to build and test the software. After installing it, one can run the shell command `make` in the main directory to build the package including its build environment. Then, the package can be loaded e.g. with the shell command `julia test/test.jl`.

## Development

This package is using [wrapit](https://github.com/grasph/wrapit), [CxxWrap.jl](https://github.com/JuliaInterop/CxxWrap.jl) and [libcxxwrap-julia](https://github.com/JuliaInterop/libcxxwrap-julia) to automatically generate julia bindings for the C++ code in the [`src`](src) directory.
[Earthly](https://earthly.dev/) will then generate the julia package including the library with the bindings to the directory `out`.
Hereby, the file `out/jlCxxCalc.so` contains the C++ functions and classes provided in the directory [`src`](src), as well as the C++ part of the julia wrapper [libcxxwrap-julia](https://github.com/JuliaInterop/libcxxwrap-julia).
The API mapping C++ functions to julia ones are in the file `out/jlCxxCalc.cxx`.