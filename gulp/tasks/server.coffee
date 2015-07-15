gulp 	   = require 'gulp'
ecstatic = require 'ecstatic'
http     = require 'http'

gulp.task 'server', ->

	http
		.createServer ecstatic root: __dirname + '/../../public'
		.listen 3000