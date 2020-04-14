# Omni core docker



### Deployment ###

* git clone git@github.com:bobyeoh/omnicore-docker.git
* docker build --tag ominicore-docker .
* docker run -p 8332:8332 -v bitcoin/:/root/ --name="ominicore" -d ominicore-docker
