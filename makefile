setup:
	npm install
	bower install

watch:
	NODE_ENV=development gulp

release:
	NODE_ENV=production gulp build

cli_compile:
	make cli_compile
	cd cli && sudo npm install -g