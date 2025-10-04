# Base image with micromamba 
FROM mambaorg/micromamba:1.5.8

# Copy environment spec and create the env in base 
COPY --chown=$MAMBA_USER:$MAMBA_USER environment.yml /tmp/environment.yml
RUN micromamba install -y -n base -f /tmp/environment.yml && \
    micromamba clean -a -y

# Set float32 globally for PyTensor 
ENV PYTENSOR_FLAGS="floatX=float32"

# Jupyter settings
ENV JUPYTER_ENABLE_LAB=yes
WORKDIR /workspace
EXPOSE 8888

# start Jupyter Lab
CMD ["bash", "-lc", "micromamba run -n base jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --ServerApp.token='' --ServerApp.password='' --ServerApp.allow_origin='*' --ServerApp.allow_remote_access=True --ServerApp.root_dir=/workspace"]
