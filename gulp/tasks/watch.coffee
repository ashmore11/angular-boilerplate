gulp       = require 'gulp'
livereload = require 'gulp-livereload'

paths =
	scripts   : require('./scripts').paths
	templates : require('./templates').paths
	styles    : require('./styles').paths

gulp.task "watch", ->

	livereload.listen()

	gulp.watch paths.scripts.watch,   ['scripts']
	gulp.watch paths.templates.watch, ['templates']
	gulp.watch paths.styles.watch,    ['styles']

	.emit 'update'