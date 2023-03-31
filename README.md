# Julia bindings for a C++ library

## Get Started

[Earthly](https://earthly.dev/) is used to build and test the software. After installing it, one can run the shell command `make` in the main directory to build the package including its build environment. Then, the package can be loaded e.g. with the shell command `julia test/test.jl`.

## Development

This package is using [wrapit](https://github.com/grasph/wrapit), [CxxWrap.jl](https://github.com/JuliaInterop/CxxWrap.jl) and [libcxxwrap-julia](https://github.com/JuliaInterop/libcxxwrap-julia) to automatically generate julia bindings for the C++ code in the [`src`](src) directory.
[Earthly](https://earthly.dev/) will then generate the julia package including the library with the bindings in the directory `out`.