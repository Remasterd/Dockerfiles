FROM ubuntu:20.04 AS source
RUN set -eux; \
    apt-get update \
        && apt-get install -y --no-install-recommends apt-utils software-properties-common apt-transport-https ca-certificates iputils-ping ; \
    which ping

FROM alpine:latest  
RUN mkdir -p /usr/bin
COPY --from=source /usr/bin/ping /usr/bin/ping
CMD ["ping"]  
