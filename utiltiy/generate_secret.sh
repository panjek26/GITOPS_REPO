#!/usr/bin/env bash

KEY_ENV=prod
KEY_NAME=abc-conn-secret

kubectl create secret generic dbpwd --dry-run=client \
	--from-literal=password=panji \
	--output=yaml > ./${KEY_NAME}-${KEY_ENV}-opaque.yaml

kubeseal --format yaml --scope cluster-wide < ./${KEY_NAME}-${KEY_ENV}-opaque.yaml > ./${KEY_NAME}-${KEY_ENV}-sealed.yaml
