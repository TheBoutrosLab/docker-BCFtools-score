ARG MINIFORGE_VERSION=26.1.1-2
ARG UBUNTU_VERSION=24.04
ARG CONDA_ENV_PATH=/opt/conda/envs/bcftools
ARG BCFTOOLS_PLUGINS_PATH=${CONDA_ENV_PATH}/bcftools-score

FROM condaforge/miniforge3:${MINIFORGE_VERSION} AS builder

ARG CONDA_ENV_PATH
ARG BCFTOOLS_PLUGINS_PATH

ARG BCFTOOLS_VERSION=1.22

# See https://github.com/hadolint/hadolint/wiki/DL4006
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN mamba create -qy -p ${CONDA_ENV_PATH} \
    -c bioconda \
    -c conda-forge \
    bcftools==${BCFTOOLS_VERSION} && \
    mamba clean -afy

RUN apt-get update && \
    apt-get install -y --no-install-recommends unzip && \
    rm -rf /var/lib/apt/lists/*

ARG SCORE_VERSION=1.22-20250819
ARG SCORE_HASH="7fe33c29a42beaa55bef6f4fc389c2606f3a06f5fd3a0f82a3ca0d05edc2c9a4"

RUN wget "https://software.broadinstitute.org/software/score/score_${SCORE_VERSION}.zip" \
        --no-verbose \
        -O /tmp/score.zip

# Split this into a separate RUN command to make the failure case a little more
# readable
RUN echo "${SCORE_HASH}  /tmp/score.zip" | sha256sum -c - || \
    { echo Score release has invalid hash; exit 1; } && \
    unzip /tmp/score.zip -d ${BCFTOOLS_PLUGINS_PATH}

# Deploy the target tools into a base image
FROM ubuntu:${UBUNTU_VERSION} AS final

ARG CONDA_ENV_PATH
ARG BCFTOOLS_PLUGINS_PATH

COPY --from=builder ${CONDA_ENV_PATH} ${CONDA_ENV_PATH}

ENV CONDA_ENV_PATH="${CONDA_ENV_PATH}" \
    PATH="${CONDA_ENV_PATH}/bin:${PATH}"

# Add a new user/group called bldocker
RUN groupadd -g 500001 bldocker && \
    useradd -r -u 500001 -g bldocker bldocker

# Change the default user to bldocker from root
USER bldocker

ENV BCFTOOLS_PLUGINS=${BCFTOOLS_PLUGINS_PATH}

LABEL   maintainer="Yash Patel <ypatel@sbpdiscovery.org>" \
        org.opencontainers.image.source=https://github.com/TheBoutrosLab/docker-BCFtools-score
