.PHONY: all
all:
	find . -type f -not -path '.git/*' -exec sed -i 's/TEMPLATE/'$$(basename ${CURDIR})'/g' {} \;
	sed -i '1,9d' Makefile
	git commit -a -m "automated customize repo"
	@echo -e '\n\033[1mTODO:\033[0m'
	@echo -e '\tDisable: Wikis, Projects @ https://github.com/seankhliao/'$$(basename ${CURDIR})'/settings'
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
