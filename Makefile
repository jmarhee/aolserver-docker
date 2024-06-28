.SILENT:
build-offline:
	docker build . -t aolserver-offline -f Dockerfile.offline --no-cache

.SILENT:
build:
	docker build . -t aolserver -f Dockerfile --no-cache
