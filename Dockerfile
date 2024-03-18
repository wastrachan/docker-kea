FROM alpine:latest

LABEL org.opencontainers.image.title="Docker Kea"
LABEL org.opencontainers.image.description="ISC Kea on Alpine Linux"
LABEL org.opencontainers.image.authors="Winston Astrachan"
LABEL org.opencontainers.image.source="https://github.com/wastrachan/docker-kea/"
LABEL org.opencontainers.image.licenses="MIT"

RUN apk --no-cache add kea kea-hook-ha kea-ctrl-agent
RUN mkdir /config /run/kea/

COPY overlay/ /
VOLUME /config

EXPOSE 67/udp
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/kea-dhcp4", "-c", "/config/kea.conf" ]
