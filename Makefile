.PHONY: run,hello

# Set the default target to be the help for this Makefile
.DEFAULT_GOAL: help
SHELL:=bash

help: # http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
	@echo
	@echo The targets available in this project are:
	@grep -h -E '^[a-zA-Z0-9_%/-\.]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\t\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo

env-%:
	@if [ "${${*}}" = "" ]; then \
		echo "Environment variable $* not set"; \
		exit 1; \
	fi
hello:
	@echo "Hello"
before:
	@echo "Before"
run: ## Test script execution
run: ENVIRONMENT=dev
run:
	@echo Environment: ${ENVIRONMENT}
	@./scripts/run.sh -e ${ENVIRONMENT} -m "The message" devCommand1
