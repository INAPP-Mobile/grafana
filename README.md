# Grafana

Open-source observability platform for real-time metrics, logs, and alerting across any infrastructure stack.

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.com/deploy/grafana-3)

## Features

- Interactive dashboards with drag-and-drop panels
- Multi-source data ingestion (Prometheus, InfluxDB, Elasticsearch, and 50+ others)
- Real-time alerting with Slack, PagerDuty, email, and webhook notifications
- Built-in user authentication and RBAC
- Explore mode for ad-hoc querying
- Plugin ecosystem for custom visualizations and data sources

## Configuration

| Variable | Description | Default |
|---|---|---|
| `GF_SECURITY_ADMIN_USER` | Grafana admin username | `admin` |
| `GF_SECURITY_ADMIN_PASSWORD` | Grafana admin password | *(required)* |
| `GF_SERVER_HTTP_PORT` | HTTP listen port | `3000` |
| `GF_PATHS_DATA` | Persistent data directory | `/var/lib/grafana` |
| `GF_PATHS_LOGS` | Log directory | `/var/log/grafana` |
| `GF_PATHS_PLUGINS` | Plugins directory | `/var/lib/grafana/plugins` |
| `GF_PATHS_PROVISIONING` | Provisioning configs directory | `/etc/grafana/provisioning` |
| `GF_SECURITY_ALLOW_EMBEDDING` | Allow iframe embedding | `false` |

## Volumes

- `/var/lib/grafana` — Persistent data, plugins, and SQLite database

## License

AGPLv3 — [Grafana License](https://github.com/grafana/grafana/blob/main/LICENSE)

## Deploy and Host

This template deploys Grafana 13.1.1 on Railway with a persistent volume for data storage. The service runs on port 3000 with a configured health check. Set `GF_SECURITY_ADMIN_PASSWORD` on first deploy.

## About Hosting

[Railway](https://railway.app) provides managed infrastructure with automatic HTTPS, persistent volumes, private networking, and simple one-click deploys. The platform handles TLS termination, service scaling, and deployment rollbacks.

## Why Deploy on Railway

- One-click deploy from template — no manual infrastructure setup
- Built-in persistent volume for Grafana's SQLite database and plugins
- Automatic HTTPS with Railway-managed TLS certificates
- Private networking for secure connections to other Railway services
- Health monitoring with automated restart on failure

## Common Use Cases

- Infrastructure monitoring dashboard for Railway-deployed services
- Business metrics and KPI visualization
- Log aggregation and analysis with Loki integration
- IoT sensor data visualization with InfluxDB or TimescaleDB
- Kubernetes cluster monitoring with Prometheus integration

## Dependencies for Grafana

### Deployment Dependencies

This template has no required external services. For multi-source monitoring, deploy Prometheus, InfluxDB, or other data sources as sibling services in the same Railway project.
