gulp        = require 'gulp'
browserSync = require 'browser-sync'
modRewrite  = require 'connect-modrewrite'

gulp.task 'browser-sync', ->

	browserSync.init

		open: false
		notify: true
		
		server:
			
			baseDir: 'public'

			middleware: [

				modRewrite [ '^[^\\.]*$ /index.html [L]' ]

			]