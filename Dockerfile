# Použijte oficiální Python image jako základ
FROM python:3.9-slim

# Nastavte pracovní adresář v kontejneru
WORKDIR /app

# Zkopírujte soubor requirements.txt do pracovního adresáře
COPY requirements.txt .

# Nainstalujte požadované knihovny
RUN pip install --no-cache-dir -r requirements.txt

# Zkopírujte soubor aplikace do pracovního adresáře
COPY app.py .

# Definujte příkaz, který se spustí při startu kontejneru
CMD ["python", "app.py"]
