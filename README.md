# Omni core docker



### Deployment ###

* git clone git@github.com:bobyeoh/omnicore-docker.git
* docker build -t omnicore-docker .
* docker run -p 8332:8332 -v bitcoin/:/root/ --name="ominicore" -d omnicore-docker
