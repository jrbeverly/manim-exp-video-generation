.DEFAULT_GOAL:=help
SHELL:=/bin/bash

.PHONY: help circle

circle: ## Create the initial circle video
	mkdir -p media/
	docker run --rm 							  \
		--user="$(shell id -u):$(shell id -g)" 	  \
		-v "${PWD}:/manim" 						  \
		--workdir "/manim"		 				  \
		--entrypoint="" manimcommunity/manim 	  \
		manim render -qm --media_dir=media/circle \
		videos/circle/main.py CreateCircle

isometric: ## Create the initial isometric video
	mkdir -p media/
	docker run --rm 							     \
		--user="$(shell id -u):$(shell id -g)" 	     \
		-v "${PWD}:/manim" 						     \
		--workdir "/manim"		 				     \
		--entrypoint="" manimcommunity/manim 	     \
		manim render -qm --media_dir=media/isometric \
		videos/isometric/main.py MovingDots

interactive: ## Initialize interactive shell
	mkdir -p media/
	docker run --rm -it							     \
		--user="$(shell id -u):$(shell id -g)" 	     \
		-v "${PWD}:/manim" 						     \
		--workdir "/manim"		 				     \
		--entrypoint ""		 				         \
		--entrypoint="" manimcommunity/manim 	     \
		bash



help: ## Display this help message
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)