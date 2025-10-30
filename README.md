# ⚡ Elspot Forecast

Et projekt til at forudsige danske elspotpriser ved hjælp af en GRU-model.  
Projektet er struktureret i tre notebooks samt et selvstændigt Python-script, der kan køre uden interaktion.  
Alle dele kan køres både lokalt og via Docker.

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
├── Dockerfile
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

## 🐳 Kørsel i Docker

Projektet kan køres på to måder — enten via Jupyter Notebooks eller direkte som script.

### **1️⃣ Kør notebooks**
Start et Jupyter-miljø i containeren:
```bash
docker build -t elspot .
docker run -p 8888:8888 -v $(pwd):/app elspot
```

Når containeren starter, vises et link i terminalen, f.eks.:
```
http://127.0.0.1:8888/?token=xxxx
```
Åbn linket i din browser for at tilgå notebooks.

---

### **2️⃣ Kør kun forecasting-scriptet**
Hvis du kun vil køre forecasting-scriptet uden notebooks:
```bash
docker run --rm -e MODE=forecast -v $(pwd):/app elspot
```

Containeren kører `notebooks/03_forecasting.py`, loader den gemte model og scalers, og producerer plottet for næste døgns elpris.

---

## 🗂️ Data og modeller

- `data/processed/merged.csv` bruges til modeltræning og forecast.
- `models/best_model.pt` og `models/scaler_*.gz` skal være til stede for at køre forecasting.
- Mapperne `data/` og `models/` er inkluderet i repo’et, da de fylder meget lidt (<5 MB).

---

## 📊 Output

Forecast-scriptet producerer et plot som viser:
- Faktisk elpris vs. forudsagt pris for næste døgn.
- Dynamisk titel med dato for næste dag.

Ønsker du at gemme output, kan du udvide `03_forecasting.py` med:
```python
plt.savefig("../data/forecasts/forecast_<dato>.png")
```

---

## 🧾 Licens

Dette projekt er udgivet under MIT-licensen.
