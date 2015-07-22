gulp   = require 'gulp'
gulpif = require 'gulp-if'
sprite = require 'css-sprite'

development = process.env.NODE_ENV is 'development'
production  = process.env.NODE_ENV is 'production'

exports.paths =
	source       : './src/assets/*.png'
	watch        : 'src/assets/*.png'
	cssPath      : '../images/sprite/'
	destinations : [ './public/images/sprite', './src/stylus/utils' ]
	template     : './gulp/tasks/stylus.mustache'
	filename     : 'sprite.styl'

gulp.task 'sprites', ->

	sprite = gulp

		.src exports.paths.source

		.pipe sprite.stream
			name      : 'sprite'
			style     : exports.paths.filename
			cssPath   : exports.paths.cssPath
			template  : exports.paths.template
			processor : 'stylus'
			retina    : false

		.pipe gulpif '*.png',
			gulp.dest exports.paths.destinations[0]
			gulp.dest exports.paths.destinations[1]