fs    = require 'fs'
utils = require './utils'

module.exports = class MkView

	constructor: ( @name, @route ) ->

		message = 'Please give your view a name and route: app gen [view_name] [route_name]'

		# Only continue if the views name and route exist
		return console.log message unless @name and @route

		console.log 'Generating view...'

		@generateFiles()
		@populateFiles()
		@generateRoute()
		
		# Success Log
		console.log "Generated view: [ #{@name} ]"

	generateFiles: ->

		# Generate files needed for the new View
		fs.open utils.paths.controller + "#{@name}.coffee", 'w'
		fs.open utils.paths.stylus     + "#{@name}.styl" ,  'w'
		fs.open utils.paths.jade       + "#{@name}.jade" ,  'w'

	populateFiles: ->

		# Generate controller from template
		fs.readFile utils.paths.templates + 'controller.coffee', ( err, data ) =>

			fs.writeFile utils.paths.controller + "#{@name}.coffee", utils.generateTemplate( @name, data )
		
		# Generate Jade from data below
		fs.writeFile utils.paths.jade + "#{@name}.jade", utils.jadeData( @name )

		# Generate Stylus from data below
		fs.writeFile utils.paths.stylus + "#{@name}.styl", utils.stylusData( @name )

	generateRoute: ->

		# Read the data from the routes.coffee file
		fs.readFile utils.paths.routes, ( err, data ) =>

			# Temporarily remove the 404 route
			data = data.toString().replace utils.route404(), ''

			# Write in the new data with removed 404 route
			fs.writeFile utils.paths.routes, data
			
			# Append the new route
			fs.appendFile utils.paths.routes, utils.routeTemplate( @name, @route )

			# Reinsert the removed 404 route
			fs.appendFile utils.paths.routes, utils.route404()