#!/bin/bash

if [ ! "$(ls -A /usr/local/pulsar)" ]; then
	echo "Detected empty directory, deploying pulsar..."
	rsync -var /usr/local/pulsar_dist/* /usr/local/pulsar/
	rsync -var /usr/local/pulsar_dist/.venv/* /usr/local/pulsar/.venv/
fi

cd /usr/local/pulsar/

#while true; do echo "as"; sleep 40; done

if [[ "$PRIVATE_TOKEN" != "" ]]; then
	echo "Updating the private token in app.yml to ${PRIVATE_TOKEN}"; 
	sed -i 's/private_token : .*/private_token : '$PRIVATE_TOKEN'/g' app.yml
fi

cd /usr/local/pulsar && ./scripts/pulsar
