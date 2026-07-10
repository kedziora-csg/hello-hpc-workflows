FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        openmpi-bin \
        libopenmpi-dev \
        gcc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY src/hello_mpi.c /app/src/hello_mpi.c

RUN mpicc -O2 -o /app/hello_mpi /app/src/hello_mpi.c

CMD ["mpirun", "--allow-run-as-root", "-n", "4", "/app/hello_mpi"]
