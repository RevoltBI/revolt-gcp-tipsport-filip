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

# Definujte proměnnou prostředí pro Google Application Credentials
ENV GOOGLE_APPLICATION_CREDENTIALS="/app/service-account-key.json"

# Uložení klíče do souboru z proměnné prostředí při buildu Docker image
ARG SERVICE_ACCOUNT_KEY
RUN echo "$SERVICE_ACCOUNT_KEY" > /app/service-account-key.json

# Nastavení proměnné prostředí pro port
ENV PORT 8080

# Expose port 8080
EXPOSE 8080

# Definujte příkaz, který se spustí při startu kontejneru
CMD ["python", "app.py"]
