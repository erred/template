.PHONY: all
all:
	find . -type f -not -path '.git/*' -exec sed -i 's/REPO/'$(basename $(pwd) )'/g' {} \;
	find . -type f -not -path '.git/*' -exec sed -i 's/USER/seankhliao/g' {} \;
	git commit -a -m "automated customize repo"
	sed -i '1,10d' Makefile
	@echo -e '\n\033[1mTODO:\033[0m'
	@echo -e '\tDisable: Wikis, Projects @ https://github.com/seankhliao/'$(basename $(pwd))'/settings'
	@echo -e '\tEdit README.md'

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
