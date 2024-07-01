# revolt-gcp-docker-start
První GCP produkční kod. Cloud run job



New virtual enviroment 
python -m venv /path/to/new/virtual/environment
install packages
pip install -r requirements.txt



Steps: 
1.
**Vytvoření Dockerfile** 
2. 
**vytvoření Docker image: (musí být spuštěný Docker desktop)**
docker build -t my-python-app .
3. 
**Přiglášení do GCP** 
gcloud auth login
4. 
**Změna projektu:**
gcloud config set project sandbox-filip-bar
5. 
**konfigurace dockeru**
gcloud auth configure-docker
6. 
**Označte docker image a nahrajte ho do GCR:** 
docker tag my-python-app gcr.io/YOUR_PROJECT_ID/my-python-app
docker push gcr.io/YOUR_PROJECT_ID/my-python-app

(docker tag gcp-first-app gcr.io/sandbox-filip-bar/gcp-first-app)
(docker push gcr.io/sandbox-filip-bar/gcp-first-app)
7. 
**Povolení Cloud Run Api**
gcloud services enable run.googleapis.com
8. 
**vytvoření clous run job s imagem**
gcloud beta run jobs create my-python-job --image gcr.io/YOUR_PROJECT_ID/my-python-app --region YOUR_REGION
(gcloud beta run jobs create gcp-first-app --image gcr.io/sandbox-filip-bar/gcp-first-app --region europe-west1)
9.
**Spuštění cloud run jobu**
gcloud beta run jobs execute my-python-job --region YOUR_REGION



docker run -it keboola-cli

**bash:**
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/your/service-account-file.json"
