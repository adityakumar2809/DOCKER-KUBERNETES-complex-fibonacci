docker build -t $DOCKER_USERNAME/complex-fibonacci-client:latest -t $DOCKER_USERNAME/complex-fibonacci-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t $DOCKER_USERNAME/complex-fibonacci-server:latest -t $DOCKER_USERNAME/complex-fibonacci-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t $DOCKER_USERNAME/complex-fibonacci-worker:latest -t $DOCKER_USERNAME/complex-fibonacci-worker:$GIT_SHA -f ./worker/Dockerfile ./worker

docker push $DOCKER_USERNAME/complex-fibonacci-client:latest
docker push $DOCKER_USERNAME/complex-fibonacci-server:latest
docker push $DOCKER_USERNAME/complex-fibonacci-worker:latest

docker push $DOCKER_USERNAME/complex-fibonacci-client:$GIT_SHA
docker push $DOCKER_USERNAME/complex-fibonacci-server:$GIT_SHA
docker push $DOCKER_USERNAME/complex-fibonacci-worker:$GIT_SHA

kubectl apply -f k8s

kubectl set image deployments/client-deployment client=$DOCKER_USERNAME/complex-fibonacci-client:$GIT_SHA
kubectl set image deployments/server-deployment server=$DOCKER_USERNAME/complex-fibonacci-server:$GIT_SHA
kubectl set image deployments/worker-deployment worker=$DOCKER_USERNAME/complex-fibonacci-worker:$GIT_SHA