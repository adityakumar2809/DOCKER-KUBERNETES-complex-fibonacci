docker build -t "$DOCKER_USERNAME"/complex-fibonacci-client -f ./client/Dockerfile ./client
docker build -t "$DOCKER_USERNAME"/complex-fibonacci-server -f ./server/Dockerfile ./server
docker build -t "$DOCKER_USERNAME"/complex-fibonacci-worker -f ./worker/Dockerfile ./worker

docker push "$DOCKER_USERNAME"/complex-fibonacci-client
docker push "$DOCKER_USERNAME"/complex-fibonacci-server
docker push "$DOCKER_USERNAME"/complex-fibonacci-worker