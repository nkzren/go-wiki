.PHONY: build start
REPO_NAME=our-wiki


# uma modificacao qualquer
build:
	@docker build -t ${REPO_NAME} .

start:
	@docker run --rm -p 8080:8080 ${REPO_NAME}

dev:
	@docker run -v ${PWD}/content:/opt/wiki/content --rm -p 8080:8080 -ti --entrypoint=bash ${REPO_NAME}
