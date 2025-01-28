# GPU-Image

Customizing GPU Image based on https://hub.docker.com/r/cschranz/gpu-jupyter

Adding SSH, Modify Password and Commit change

Requirement
- Docker Runtime is installed
- Dockerhub Account

Download Docker file and entrypoint file, put it on the same directory

docker build -t chairulfm/custom-gpu-jupyter:v1.0 .
docker tag chairulfm/custom-gpu-jupyter:v1.0 chairulfm/custom-gpu-jupyter:latest
docker push chairulfm/custom-gpu-jupyter:v1.0
docker push chairulfm/custom-gpu-jupyter:latest

apply to kubernetes cluster
kubectl delete -f datasciencepod.yaml
