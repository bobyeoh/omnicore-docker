# Omni core docker



### Deployment ###

* git clone git@github.com:bobyeoh/omnicore-docker.git
* docker build -t omnicore-docker .
* docker run -p 8332:8332 -p 18332:18332 -p 18333:18333 -v ${PWD}/config:/root/.bitcoin -v /data/omnicore-docker/blockdata:/app/blockdata --name="omnicore" -d omnicore-docker

docker run -p 8332:8332 --name="omnicore" -d omnicore-docker