PROJECT=github.com/olivere/sqlite-docker

default: build

build:
	go build

container:
	docker run --rm -v "$$PWD/.:/go/src/$(PROJECT)" -w /go/src/$(PROJECT) golang:1.7 go build -a -installsuffix cgo -ldflags "-w -s" -o sqlite-docker $(PROJECT)
	docker build -t sqlite-docker .

run-container:
	docker run --rm -it sqlite-docker
