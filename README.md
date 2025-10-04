# Dockerized PyMC Notebook Environment

This repository contains a Docker setup to run your PyMC/ArviZ/Scikit-Learn notebooks reproducibly with Jupyter Lab.

## What's included
- Conda environment via `environment.yml` (Python 3.11, PyMC, PyTensor, ArviZ, NumPy/SciPy, Pandas, scikit-learn, Matplotlib, JupyterLab).
- PyTensor set to use float32 (`PYTENSOR_FLAGS=floatX=float32`) to reduce memory usage for Bayesian models.
- A lightweight Dockerfile based on `mambaorg/micromamba`.

## Prerequisites
- Docker installed.

## Build the image
From the project root (`working_file2/`):

```bash
docker build -t pymc-notebook:latest .
```

## Run Jupyter Lab with your local notebooks mounted
Mount the current directory into `/workspace` inside the container and expose port 8888.

```bash
# Linux / macOS
docker run --rm -it \
  -p 8888:8888 \
  -v "$(pwd)":/workspace \
  pymc-notebook:latest
```

Then open Jupyter Lab at:

- http://localhost:8888
