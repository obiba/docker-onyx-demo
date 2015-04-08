#
# Docker helper
#

no_cache=false

help:
	@echo "make build run stop clean"

#
# Onyx
#

# Build Onyx Docker image
build:
	docker build --no-cache=$(no_cache) -t="obiba/onyx-demo:snapshot" .

# Run a Onyx Docker instance
run:
	docker run -d -p 8888:8080 --name onyx obiba/onyx-demo:snapshot

# Run a Onyx Docker instance with shell
run-sh:
	docker run -ti -p 8888:8080 --name onyx obiba/onyx-demo:snapshot bash

# Show logs
logs:
	docker logs onyx

# Stop a Onyx Docker instance
stop:
	docker stop onyx

# Stop and remove a Onyx Docker instance
clean: stop
	docker rm onyx
