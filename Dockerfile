FROM grafana/grafana:13.1.1

USER root

# Create entrypoint that fixes volume permissions at runtime,
# then drops to the grafana user before starting Grafana
RUN printf '#!/bin/sh\nset -e\nchown -R 472:472 /var/lib/grafana 2>/dev/null || true\nexec gosu grafana /run.sh\n' > /docker-entrypoint.sh && chmod +x /docker-entrypoint.sh

ENV GF_SECURITY_ALLOW_EMBEDDING=false \
    GF_SERVER_HTTP_PORT=3000 \
    GF_PATHS_DATA=/var/lib/grafana \
    GF_PATHS_LOGS=/var/log/grafana \
    GF_PATHS_PLUGINS=/var/lib/grafana/plugins \
    GF_PATHS_PROVISIONING=/etc/grafana/provisioning

EXPOSE 3000

ENTRYPOINT ["/docker-entrypoint.sh"]

HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
  CMD wget --no-verbose --tries=1 -q http://localhost:3000/api/health || exit 1
