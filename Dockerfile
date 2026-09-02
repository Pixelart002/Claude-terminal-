FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y curl git ca-certificates python3 && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://claude.ai/install.sh | bash

ENV PATH="/root/.local/bin:${PATH}"

WORKDIR /workspace

CMD ["bash", "-lc", "python3 -m http.server ${PORT:-10000} --bind 0.0.0.0"]
