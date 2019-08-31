.PHONY: all
all:
	sed -i 's/REPO/'$(basename $PWD )'/g' **/*
	sed -i 's/USER/seankhliao/g' **/*

.PHONY: build
build:
	go build -mod=vendor

.PHONY: clean
clean:
	go clean

.PHONY: update
update:
	go get -u
	go mod tidy
	go mod vendor
