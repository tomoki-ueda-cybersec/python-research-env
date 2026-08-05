FROM mambaorg/micromamba:2.3.2

ENV PYTHONUNBUFFERED=1
ENV MAMBA_DOCKERFILE_ACTIVATE=1

COPY --chown=$MAMBA_USER:$MAMBA_USER environment.yml /tmp/environment.yml

RUN micromamba install -n base -f /tmp/environment.yml -y && \
    python -m pip install --upgrade pip && \
    micromamba clean --all --yes

WORKDIR /workspace

LABEL org.opencontainers.image.title="Python research env"
LABEL org.opencontainers.image.description="General Python research environment with molecular dynamics analysis tools"
LABEL org.opencontainers.image.source="https://github.com/<OWNER>/<REPO>"
LABEL org.opencontainers.image.licenses="MIT"
