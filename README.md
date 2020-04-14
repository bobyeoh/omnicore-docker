# Omni core docker



### Deployment ###

* git clone git@github.com:bobyeoh/omnicore-docker.git
* docker build -t omnicore-docker .
* docker run -p 8332:8332 -v /data/omnicore-docker/config:/app/config -v /data/omnicore-docker/blockdata:/app/blockdata --name="ominicore" -d omnicore-docker
