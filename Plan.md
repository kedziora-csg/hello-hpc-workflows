# hello-hpc-workflows

A learning project for GitHub Actions CI workflows targeting HPC-style workloads.

## Goal

Compile and run an MPI "Hello World" program using GitHub Actions, demonstrating how to set up reproducible HPC workflows with containers.

## Plan

### 1. MPI Hello World Source Code
- Write a simple `hello_mpi.c` program that uses `MPI_Init`, `MPI_Comm_rank`, `MPI_Comm_size`, and `MPI_Finalize` to print a greeting from each MPI rank.

### 2. Dockerfile
- Create a `Dockerfile` based on a suitable base image (e.g., `ubuntu` or `hpcng/singularity`).
- Install an MPI implementation (e.g., OpenMPI or MPICH) and GCC.
- Copy the source code into the image and compile it with `mpicc`.
- Set the default entrypoint or CMD to run the compiled binary with `mpirun`.

### 3. GitHub Actions Workflow
- Create `.github/workflows/mpi-hello.yml`.
- Steps:
  1. Check out the repository.
  2. Build the Docker image.
  3. Run the container with `mpirun -n <N> ./hello_mpi` and capture output.
  4. (Optional) Upload build artifacts or logs.

### 4. Stretch Goals
- Parameterize the number of MPI ranks via workflow inputs.
- Add a matrix strategy to test with both OpenMPI and MPICH.
- Explore GitHub-hosted vs. self-hosted runners for HPC relevance.
- Integrate with a job scheduler stub (e.g., a SLURM batch script inside the container).

## Directory Structure (target)

```
hello-hpc-workflows/
├── Plan.md
├── Dockerfile
├── src/
│   └── hello_mpi.c
└── .github/
    └── workflows/
        └── mpi-hello.yml
```
