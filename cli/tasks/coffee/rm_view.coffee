fs    = require 'fs'
utils = require './utils'

module.exports = class RmView

	constructor: ( @name, @route ) ->

		message = 'Please pass the name and route of the view you wish to delete: app del [view_name] [route_name]'

		# Only continue if the views name and route exist
		return console.log message unless @name and @route

		console.log 'Deleting view...'

		@deleteFiles()
		@deleteRoute()

		# Success Log
		console.log "Deleted view: [ #{@name} ]"

	deleteFiles: ->

		# Delete all the files that match the View passed from the command line
		fs.unlink utils.paths.controller + "#{@name}.coffee", ( err ) => @errorMessage( err ) if err
		fs.unlink utils.paths.jade       + "#{@name}.jade",   ( err ) => @errorMessage( err ) if err
		fs.unlink utils.paths.stylus     + "#{@name}.styl",   ( err ) => @errorMessage( err ) if err
		fs.unlink utils.paths.html       + "#{@name}.html",   ( err ) => @errorMessage( err ) if err

	deleteRoute: ->

		# Read the data from the routes.coffee file
		fs.readFile utils.paths.routes, ( err, data ) =>

			# Get the route for the given view and remove it
			data = data.toString().replace utils.routeTemplate( @name, @route ), ''
			
			fs.writeFile utils.paths.routes, data

	errorMessage: ( error ) ->

		console.log "It looks like #{error.path} wasn't found..."