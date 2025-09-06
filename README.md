# 💳 Loan Prediction MLOps System

This project is an **end-to-end MLOps pipeline** for **loan approval prediction** using **Gradient Boosting Classifier**.

It integrates **FastAPI for deployment**, **Prometheus & Grafana for monitoring**, and **Population Stability Index (PSI) for drift detection**.  

The system ensures **high availability, low latency, automated CI/CD, and transparency** in model-driven decision-making.

---------------------------------------------------------------------------------------------------

## ⚙️ Features

- **Machine Learning Model**  
  - Gradient Boosting Classifier with **82.3% accuracy**  
  - Trained on historical loan application data  

- **API Deployment**  
  - **FastAPI-based RESTful API** for real-time predictions  
  - Sub-100ms response latency (p95) with **0% error rate**  

- **Monitoring & Drift Detection**  
  - **Prometheus + Grafana** dashboards for real-time metrics  
  - **Population Stability Index (PSI)** for detecting data drift  

- **MLOps Integration**  
  - CI/CD automation with **GitHub Actions**  
  - Seamless retraining and redeployment workflow  
  - **100% uptime achieved during testing**  

---------------------------------------------------------------------------------------------------

## 🚀 Installation & Usage

1. Clone the repository:
```bash
git clone https://github.com/muskan764/loan-prediction-mlops.git
cd loan-prediction-mlops
```

Install dependencies:

pip install -r requirements.txt
Train the model:

python src/train.py

Start the FastAPI server:

uvicorn api.main:app --reload

Access the API at:

http://127.0.0.1:8000/docs

---------------------------------------------------------------------------------------------------

## 📊 Key Deliverables

✅ Loan approval prediction system with 82.3% accuracy

✅ FastAPI REST API with sub-100ms latency (p95)

✅ Monitoring dashboards with Prometheus & Grafana

✅ PSI-based drift detection for data stability

✅ CI/CD with GitHub Actions (30% improved deployment reliability)
