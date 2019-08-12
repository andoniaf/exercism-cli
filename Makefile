IMAGE_NAME = andoniaf/exercism-cli

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
		@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# Docker Tasks
build: ## Build the container
		docker build -t $(IMAGE_NAME) .

run: ## Run container, rm when end
		docker run --rm --name="$(IMAGE_NAME)" $(IMAGE_NAME)

test: ## Test dockerfile and image
		bash testDockerfile.sh $(IMAGE_NAME)
