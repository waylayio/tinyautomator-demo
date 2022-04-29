FROM debian:bullseye-slim
RUN apt-get update && apt-get install -y --no-install-recommends \
      fswebcam mosquitto-clients \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /scripts
COPY --chmod=755 capture.sh /scripts
WORKDIR /scripts
ENTRYPOINT []
CMD ["/scripts/capture.sh"]
