gulp        = require 'gulp'
classify    = require 'gulp-ng-classify'
coffee      = require 'gulp-coffee'
concat      = require 'gulp-concat'
handleError = require '../util/handle_error'
uglify      = require 'gulp-uglify'
livereload  = require 'gulp-livereload'

development = process.env.NODE_ENV is 'development'
production  = process.env.NODE_ENV is 'production'

exports.paths =
	source      : './src/coffee/**/*.coffee'
	watch       : './src/coffee/**/*.coffee'
	destination : './public/js/'
	filename    : 'app.js'

gulp.task 'scripts', ->

	scripts = gulp

		.src exports.paths.source
	
		.pipe classify()
		.pipe coffee bare: false
		.pipe concat exports.paths.filename

		.on 'error', handleError
		
	scripts.pipe uglify() if production
	scripts.pipe gulp.dest exports.paths.destination
	scripts.pipe livereload() if development