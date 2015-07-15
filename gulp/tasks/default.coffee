gulp = require 'gulp'

gulp.task "build", [
	'scripts',
	'templates',
	'styles',
	'vendor'
]

gulp.task "default", [
	'build',
	'watch',
	'server'
]