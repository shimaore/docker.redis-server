NAME=`jq -r .docker_name package.json`
TAG=`jq -r .version package.json`

image:
	docker build --rm=true -t ${NAME}:${TAG} .

image-no-cache:
	docker build --rm=true --no-cache -t ${NAME}:${TAG} .

tests:
	npm test

push: image tests
	docker push ${NAME}:${TAG}
