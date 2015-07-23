setup:
	npm install
	bower install

watch:
	NODE_ENV=development gulp

release:
	NODE_ENV=production gulp build

cli:
	shjs cli/build.coffee
	cd cli && sudo npm install -g

open_localhost:
	open "http://localhost:3000"

open_sublime:
	open -a "sublime Text 2" .