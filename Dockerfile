# --- Base image ---
FROM python:3.10-slim

# --- Arbejdsmappe ---
WORKDIR /app

# --- Kopiér projekt ---
COPY . /app

# --- Installer afhængigheder ---
RUN pip install --no-cache-dir -r requirements.txt jupyter

# --- Port til Jupyter Notebook ---
EXPOSE 8888

# --- Miljøvariabel der styrer mode ---
# MODE=jupyter -> starter notebook-server
# MODE=forecast -> kører forecasting-script
ENV MODE=jupyter

# --- Standardkommando ---
CMD if [ "$MODE" = "forecast" ]; then \
        python notebooks/03_forecasting.py; \
    else \
        jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root; \
    fi
