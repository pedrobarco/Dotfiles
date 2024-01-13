#!/bin/bash
# Install docker

if [ "$(uname)" == "Darwin" ]; then
	brew install --cask docker
else
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
		| gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
	echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
		https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
		| sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	apt update
	apt install -y \
		docker-ce \
		docker-ce-cli \
		containerd.io
fi
