.PHONY: all
all:
	sed -i 's/REPO/'$(basename $PWD )'/g' **/*
	sed -i 's/USER/seankhliao/g' **/*
	echo 'Disable: Wikis, Projects @ https://github.com/seankhliao/'$(basename $PWD)'/settings'
	echo 'Edit README.md'
	git commit -a -m "customize repo"
	sed -i '1,9d' Makefile

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
