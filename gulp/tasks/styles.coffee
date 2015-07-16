gulp        = require 'gulp'
stylus      = require 'gulp-stylus'
nib         = require 'nib'
rupture     = require 'rupture'
jeet        = require 'jeet'
handleError = require '../util/handle_error'
CSSmin      = require 'gulp-minify-css'

development = process.env.NODE_ENV is 'development'
production  = process.env.NODE_ENV is 'production'

exports.paths =
	source      : './src/stylus/app.styl'
	watch       : 'src/stylus/**/*.styl'
	destination : './public/css/'

gulp.task 'styles', ->

	styles = gulp
		
		.src exports.paths.source
		
		.pipe stylus
			set     : [ 'include css' ]
			use     : [ nib(), rupture(), jeet() ]
			linenos : development

		.on 'error', handleError

	styles = styles.pipe CSSmin() if production
	styles = styles.pipe gulp.dest exports.paths.destination