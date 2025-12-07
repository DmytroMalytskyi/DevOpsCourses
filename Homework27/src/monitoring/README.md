Prometheus + Grafana + Alertmanager



## Швидкий старт

```bash
cd monitoring
cp .env.example .env
# відредагуй .env і встав свій TELEGRAM_BOT_TOKEN
cd dashboards && bash download.sh && cd ..
docker compose up -d
```

- Prometheus: http://localhost:9090
- Grafana: http://localhost:3000 (admin / admin або пароль з `.env`)
- Alertmanager: http://localhost:9093
- cAdvisor: http://localhost:8080
- Node Exporter: http://localhost:9100/metrics
- Blackbox: http://localhost:9115


1. Отримати `TELEGRAM_BOT_TOKEN` у BotFather та вставити у `.env`.
2. Перевірити `TELEGRAM_CHAT_ID` (вже заповнений).
3. Завантажити дашборди: `cd dashboards && bash download.sh`.
4. Перезапустити Grafana: `docker compose restart grafana`.


