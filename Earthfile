VERSION 0.7
FROM alpine:3.17.2
WORKDIR /work

main:
    BUILD +buildenv
    BUILD +build
    BUILD +test

buildenv:
    FROM DOCKERFILE -f buildenv/Dockerfile buildenv
    SAVE IMAGE danlooo/build-cxx-julia

build:
    FROM +buildenv
    COPY src src/
    RUN build src
    SAVE ARTIFACT out

test:
    FROM julia:1.8.5
    RUN julia -e 'using Pkg; Pkg.add("CxxWrap")'
    COPY +build/out/ out/
    COPY test/ test/
    RUN julia test/test.jl