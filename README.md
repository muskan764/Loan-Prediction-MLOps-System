# Loan Prediction MLOps Project (Prometheus + Grafana, no Docker)

This repo contains a complete, minimal MLOps setup for a Loan Prediction model with:
- **FastAPI** model service exposing `/predict`, `/health`, `/metrics`
- **Prometheus** scraping metrics from the API and a **drift exporter**
- **Grafana** dashboard ready to import
- **No Docker**: instructions use native installs and `systemd` (optional) or direct CLI.

## Quickstart

### 1) Create & activate a Python environment
```bash
python -m venv .venv
source .venv/bin/activate  # Windows: .venv\Scripts\activate
pip install -r requirements.txt
```

### 2) Train (or re-train) the model
```bash
python src/train.py --data ./data/loan_approval_dataset.csv --target " loan_status" --out ./models/loan_model.pkl
```

### 3) Run the API (port 8000)
```bash
uvicorn api.main:app --host 0.0.0.0 --port 8000 --reload
```

### 4) Install & run Prometheus (native)
- Download Prometheus for your OS: https://prometheus.io/download/
- Start it pointing to `./configs/prometheus.yml`:
```bash
./prometheus --config.file=./configs/prometheus.yml
```
Prometheus will scrape:
- `http://localhost:8000/metrics` (API)
- `http://localhost:8002/metrics` (drift exporter)

### 5) Start the drift exporter (port 8002)
```bash
python monitoring/drift_exporter.py --train ./data/loan_approval_dataset.csv --log ./monitoring/inference_log.parquet --port 8002
```

### 6) Install & run Grafana (native)
- Download Grafana: https://grafana.com/grafana/download
- Start Grafana, then add Prometheus as a data source (URL: `http://localhost:9090` by default).
- Import the dashboard from `dashboards/loan_dashboard.json`.

## API

**POST** `/predict` — body is a JSON object with feature names/values.
Unknown/missing features are handled via the pipeline imputers/encoders.

Example:
```json
{ "Gender": "Male", "Married": "Yes", "ApplicantIncome": 5000, "Credit_History": 1 }
```

**GET** `/metrics` — Prometheus metrics exposition.

**GET** `/health` — simple health probe.

## Monitoring

- **Requests & latency** via Prometheus counters and histograms.
- **Model score** gauge updates with the last `predict_proba` output.
- **Data drift (PSI)** computed by `monitoring/drift_exporter.py` on recent inference logs.

## CI (GitHub Actions)

This workflow runs lint + unit tests + a quick training to ensure pipelines load.
