# docker-hashicorp
Image with Hashicorp tools

## Build & Deploy
Make sure you have logged in to Dockerhub as accessionhealth
```
# docker build -t accessionhealth/docker-hashicorp:latest .
docker buildx build --platform=linux/amd64,linux/arm64 -t accessionhealth/docker-hashicorp:latest .
docker push accessionhealth/docker-hashicorp:latest 
```
