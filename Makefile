# Docker Image Makefile
#
# Copyright (c) Winston Astrachan 2022
#
help:
	@echo ""
	@echo "Usage: make COMMAND"
	@echo ""
	@echo "Docker Image makefile"
	@echo ""
	@echo "Commands:"
	@echo "  build        Build and tag image"
	@echo "  run          Start container in the background with locally mounted volume"
	@echo "  stop         Stop and remove container running in the background"
	@echo "  clean        Mark image for rebuild"
	@echo "  delete       Delete image and mark for rebuild"
	@echo ""

build: .kea.img

.kea.img:
	docker build -t wastrachan/kea:latest .
	@touch $@

.PHONY: run
run: build
	docker run -v "$(CURDIR)/config:/config" \
	           --name kea \
	           -p 67:67/udp \
	           --restart unless-stopped \
	           wastrachan/kea:latest

.PHONY: stop
stop:
	docker stop kea
	docker rm kea

.PHONY: clean
clean:
	rm -f .kea.img

.PHONY: delete
delete: clean
	docker rmi -f wastrachan/kea
