fs    = require 'fs'
utils = require './utils.js'

class ViewGenerator

	paths :
		templates : 'cli/templates/'
		coffee    : 'src/coffee/controllers/views/'
		jade      : 'src/jade/views/'
		stylus    : 'src/stylus/views/'
		routes    : 'src/coffee/routes/routes.coffee'

	constructor: ( view, route ) ->

		message = 'Please give your view a name and route: app gen [view_name] [route_name]'

		# Only continue if the views name and route exist
		return console.log message unless view and route

		console.log 'Generating view...'
		
		@view  = view.toLowerCase()
		@route = route.toLowerCase()

		@generateFiles()
		@populateFiles()
		@generateRoute()
		
		# Success Log
		console.log "Generated view: [ #{@view} ]"

	generateFiles: ->

		# Generate files needed for the new View
		fs.open @paths.coffee + "#{@view}.coffee", 'w'
		fs.open @paths.stylus + "#{@view}.styl" ,  'w'
		fs.open @paths.jade   + "#{@view}.jade" ,  'w'

	populateFiles: ->

		# Generate controller from template
		fs.readFile @paths.templates + 'controller.coffee', ( err, data ) =>

			fs.writeFile @paths.coffee + "#{@view}.coffee", utils.generateData( @view, data )
		
		# Generate Jade from data below
		fs.writeFile @paths.jade + "#{@view}.jade", utils.jadeData( @view )

		# Generate Stylus from data below
		fs.writeFile @paths.stylus + "#{@view}.styl", utils.stylusData( @view )

	generateRoute: ->

		# Read the data from the routes.coffee file
		fs.readFile @paths.routes, ( err, data ) =>

			# Temporarily remove the 404 route
			data = data.toString().replace utils.route404(), ''

			# Write in the new data with removed 404 route
			fs.writeFile @paths.routes, data
			
			# Append the new route
			fs.appendFile @paths.routes, utils.routeData( @view, @route )

			# Reinsert the removed 404 route
			fs.appendFile @paths.routes, utils.route404()

module.exports = ViewGenerator