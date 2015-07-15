gulp           = require 'gulp'
mainBowerFiles = require 'main-bower-files'
concat         = require 'gulp-concat'
handleError    = require '../util/handle_error'
uglify         = require 'gulp-uglify'

development = process.env.NODE_ENV is 'development'
production  = process.env.NODE_ENV is 'production'

exports.paths =
	source      : do mainBowerFiles
	destination : './public/js/'
	filename    : 'vendor.js'
 
gulp.task 'vendor', ->

	vendor = gulp

		.src exports.paths.source
		
		.pipe concat exports.paths.filename

		.on 'error', handleError

	vendor.pipe uglify() if production
	vendor.pipe gulp.dest exports.paths.destination