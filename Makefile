.PHONY: train api prometheus drift grafana

train:
	python src/train.py --data ./data/loan_approval_dataset.csv --out ./models/loan_model.pkl

api:
	uvicorn api.main:app --host 0.0.0.0 --port 8000

drift:
	python monitoring/drift_exporter.py --train ./data/loan_approval_dataset.csv --log ./monitoring/inference_log.parquet --port 8002
