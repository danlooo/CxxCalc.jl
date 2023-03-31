VERSION 0.7
FROM alpine:3.17.2
WORKDIR /work

main:
    FROM debian:bullseye-slim
    WORKDIR /work
    RUN apt-get update && \
        apt-get install -y build-essential cmake git clang libclang-dev
    RUN git init && \
        git remote add origin https://github.com/grasph/wrapit && \
        git fetch origin v0.1.0 && \
        git reset --hard FETCH_HEAD
    RUN cmake . && make
    RUN cp wrapit /bin/wrapit
    SAVE ARTIFACT wrapit

    COPY src src/
    SAVE IMAGE dev
    # TODO: Add jlcxx/jlcxx.hpp and stuff
    RUN cd src && source setup.sh && make all
    RUN julia -e "using Hello"
