VERSION 0.7
FROM alpine:3.17.2
WORKDIR /work

main:
    BUILD +buildenv
    BUILD +cxxcalc-julia
    BUILD +test

buildenv:
    FROM DOCKERFILE -f buildenv/Dockerfile buildenv
    SAVE IMAGE danlooo/build-cxx-julia

cxxcalc-julia:
    FROM +buildenv
    COPY cxxcalc cxxcalc/
    RUN build cxxcalc
    SAVE ARTIFACT out AS LOCAL cxxcalc-julia

test:
    FROM julia:1.8.5
    RUN julia -e 'using Pkg; Pkg.add("CxxWrap")'
    COPY +cxxcalc-julia/out/ out/
    COPY test/ test/
    RUN julia test/test.jl