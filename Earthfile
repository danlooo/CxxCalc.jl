VERSION 0.7
FROM alpine:3.17.2
WORKDIR /work

buildenv:
    FROM DOCKERFILE -f buildenv/Dockerfile buildenv
    SAVE IMAGE danlooo/build-cxx-julia

main:
    FROM +buildenv
    COPY src src/
    RUN build src
    SAVE ARTIFACT out
