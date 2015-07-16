gulp        = require 'gulp'
browserSync = require 'browser-sync'

gulp.task 'browser-sync', ->

	browserSync.init

		server:
			
			baseDir: [ 'src', 'public' ]