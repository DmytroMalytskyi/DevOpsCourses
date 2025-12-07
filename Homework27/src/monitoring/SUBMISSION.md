# Інструкція — які скріни надати

## 1) Скріншоти метрик у Prometheus
- `node_memory_MemAvailable_bytes` → Graph
- `rate(node_cpu_seconds_total{mode="idle"}[5m])` → Graph

## 2) Скріншоти моніторингу
- Prometheus `/targets` (усі таргети UP)
- Alertmanager UI `/`

## 3) Скріншоти дашбордів Grafana
- Node Exporter Full
- Docker Host Overview
- cAdvisor Container

## 4) Код для алертів
- Відкрий `monitoring/prometheus/alerts.yml` та зроби скрін.

## 5) Скріншоти відпрацювання алертів
- Telegram повідомлення (HighCPUUsage / LowDiskSpace / TargetDown)
- Alertmanager → Alerts (FIRING та RESOLVED)

## Підказки для тестів
- CPU: `stress-ng --cpu 4 --timeout 30`
- Disk: `fallocate -l 10G bigfile` (або змінити поріг)
- TargetDown: `docker compose stop cadvisor`

**Нагадування:** Після зміни правил перезавантажити Prometheus:
```
curl -X POST http://localhost:9090/-/reload
```