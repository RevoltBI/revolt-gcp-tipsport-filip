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
(gcloud beta run jobs create get-reviews --image gcr.io/sandbox-filip-bar/get-reviews --region europe-west1)
9.
**Spuštění cloud run jobu**
gcloud beta run jobs execute my-python-job --region YOUR_REGION

(gcloud beta run jobs execute get-reviews2 --region europe-west1)



docker run -it keboola-cli

**bash:**
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/your/service-account-file.json"
export GOOGLE_APPLICATION_CREDENTIALS="sandbox-filip-bar-c5657a3d0e99.json"



Přehození z osobního na Revoltí git repo: 
git remote -v

git config user.name
git config user.email


**SSH**
git remote remove origin 
git remote add origin git@github.com:RevoltBI/revolt-gcp-tipsport-filip.git
git branch -M main
git push -u origin main


**PowerShell Administrator:**  (SSH create -> github settings)
ssh-keygen -t ed25519 -C "your_email@example.com"
chatGPT:  ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
cat  C:\Users\barrf/.ssh/id_ed25519.pub

**zruší commit:**
git reset HEAD~1


push testing 12345678
