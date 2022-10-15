FROM alpine:latest
LABEL maintainer="Winston Astrachan"
LABEL description="ISC Kea Server on Alpine Linux"

RUN apk --no-cache add kea kea-hook-ha
RUN mkdir /config /run/kea/

COPY overlay/ /
VOLUME /config
EXPOSE 67/udp

# ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/kea-dhcp4", "-c", "/config/kea.conf" ]
