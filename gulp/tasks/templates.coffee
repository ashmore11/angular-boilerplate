gulp         = require 'gulp'
jade         = require 'gulp-jade'
handleError  = require '../util/handle_error'
livereload   = require 'gulp-livereload'

development = process.env.NODE_ENV is 'development'
production  = process.env.NODE_ENV is 'production'

exports.paths =
	source      : [ './src/jade/**/*.jade', '!./src/jade/mixins/**' ]
	watch       : './src/jade/**/*.jade'
	destination : './public/templates'

gulp.task 'templates', ->

	templates = gulp

		.src exports.paths.source

		.pipe jade
			pretty: development

		.on 'error', handleError

	templates.pipe gulp.dest exports.paths.destination
	templates.pipe livereload() if development