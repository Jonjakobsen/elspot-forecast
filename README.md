# ⚡ Elspot Forecast

Et projekt til at forudsige danske elspotpriser ved hjælp af en GRU-model.  
Projektet er struktureret i tre notebooks samt et selvstændigt Python-script, der kan køre uden interaktion.  


---

## 📁 Projektstruktur

```
elspot-forecast/
│
├── data/
│   ├── raw/              # Rå data
│   ├── processed/        # Renset og klargjort data
│   └── forecasts/        # Eksempler på model output
│
├── models/               # Gemte modeller og scalers
│
├── notebooks/
│   ├── 01_dataprep.ipynb     # Databehandling og feature engineering
│   ├── 02_modeltraining.ipynb # Modeltræning og hyperparameter-tuning
│   ├── 03_forecasting.ipynb   # Generering af næste døgns forecast
│   └── 03_forecasting.py      # Samme funktionalitet som notebook, men som script
│
├── requirements.txt
├── .gitignore
└── README.md
```

---

## 🧠 Indhold

### 1️⃣ `01_dataprep.ipynb`
Forbereder og renser data.

### 2️⃣ `02_modeltraining.ipynb`
Træner flere GRU-modeller via grid search og vælger den bedste.  
Gemmer:
- `best_model.pt`
- `best_params.json`
- `scaler_X.gz` og `scaler_y.gz`

### 3️⃣ `03_forecasting.ipynb` / `03_forecasting.py`
Loader den bedste model og scalerne, forudsiger elpriser for næste døgn, og visualiserer resultatet.  

---

## 💻 Kørsel lokalt

1. Opret et Python-venv og installer afhængigheder:
   ```bash
   python -m venv venv
   source venv/bin/activate      # macOS/Linux
   venv\Scripts\activate         # Windows
   pip install -r requirements.txt
   ```

2. Kør notebooks i VS Code eller Jupyter Lab,  
   **eller** kør forecasting direkte:
   ```bash
   python notebooks/03_forecasting.py
   ```

---

## 🗂️ Data og modeller

- `data/processed/merged.csv` bruges til modeltræning og forecast.
- `models/best_model.pt` og `models/scaler_*.gz` skal være til stede for at køre forecasting.
- Mapperne `data/` og `models/` er inkluderet i repo’et, da de fylder meget lidt (<5 MB).

---

## 📊 Output

03_forecasting-scriptet producerer et plot som viser modellens 
prædiktion af næste døgns spotpriser.

---


