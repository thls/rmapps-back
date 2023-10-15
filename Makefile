buildapp: buildappbuild buildapptag
	@echo finish

buildappbuild:
	docker build -t rmapps-back:$(version) .
	@echo builded

buildapptag:
	docker tag rmapps-back:$(version) rmapps-back:latest
	@echo tagged