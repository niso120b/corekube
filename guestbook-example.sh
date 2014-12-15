#!/bin/bash

VERSION=0.5.4

git clone https://github.com/GoogleCloudPlatform/kubernetes
pushd kubernetes
git checkout tags/v$VERSION

/opt/bin/kubectl create -f examples/guestbook/redis-master.json
/opt/bin/kubectl create -f examples/guestbook/redis-master-service.json
/opt/bin/kubectl create -f examples/guestbook/redis-slave-controller.json
/opt/bin/kubectl create -f examples/guestbook/redis-slave-service.json
/opt/bin/kubectl create -f examples/guestbook/frontend-controller.json
/opt/bin/kubectl get pods