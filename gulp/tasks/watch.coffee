gulp        = require 'gulp'
browserSync = require 'browser-sync'

paths =
	scripts   : require('./scripts').paths
	templates : require('./templates').paths
	styles    : require('./styles').paths

gulp.task "watch", ->

	gulp.watch paths.scripts.watch,   [ 'scripts',   browserSync.reload ]
	gulp.watch paths.templates.watch, [ 'templates', browserSync.reload ]
	gulp.watch paths.styles.watch,    [ 'styles' ]

	.emit 'update'
