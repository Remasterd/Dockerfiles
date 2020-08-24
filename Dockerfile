FROM ubuntu:20.04 AS source
RUN set -eux; \
    apt-get update && apt-get install -y --no-install-recommends iputils-ping ; \
    which ping

FROM alpine:latest  
COPY --from=source /usr/bin/ping /usr/bin/ping
RUN chmod +x /usr/bin/ping
CMD ["/usr/bin/ping"]
