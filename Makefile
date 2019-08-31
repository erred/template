.PHONY: all
all:
	find . -type f -not -path '*/\.git/*' sed -i 's/REPO/'$(basename $(pwd) )'/g' {} \;
	find . -type f -not -path '*/\.git/*' sed -i 's/USER/seankhliao/g' {} \;
	echo -e '\033[1mDisable: Wikis, Projects @ https://github.com/seankhliao/'$(basename $(pwd))'/settings\033[0m'
	echo -e '\033[1mEdit README.md\033[0m'
	git commit -a -m "automated customize repo"
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
