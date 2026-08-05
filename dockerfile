FROM mambaorg/micromamba:2.3.2

ENV PATH=/opt/conda/bin:$PATH
ENV PYTHONUNBUFFERED=1

COPY --chown=$MAMBA_USER:$MAMBA_USER environment.yml /tmp/environment.yml

RUN micromamba install -n base -f /tmp/environment.yml -y && \
    python -m pip install --upgrade pip && \
    micromamba clean --all --yes

WORKDIR /workspace

LABEL org.opencontainers.image.title="Python Research Environment"
LABEL org.opencontainers.image.description="General Python research environment including molecular dynamics analysis tools"
LABEL org.opencontainers.image.licenses="MIT"
