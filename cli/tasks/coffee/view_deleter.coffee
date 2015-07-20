fs    = require 'fs'
utils = require './utils.js'

class ViewDeleter

	constructor: ( view, route ) ->

		message = 'Please pass the name and route of the view you wish to delete: app del [view_name] [route_name]'

		# Only continue if the views name and route exist
		return console.log message unless view and route

		console.log 'Deleting view...'
			
		@view  = view.toLowerCase()
		@route = route.toLowerCase()

		@deleteFiles()
		@deleteRoute()

		# Success Log
		console.log "Deleted view: [ #{@view} ]"

	deleteFiles: ->

		# Delete all the files that match the View passed from the command line
		fs.unlink utils.paths.coffee + "#{@view}.coffee", ( err ) => @errorMessage( err ) if err
		fs.unlink utils.paths.jade   + "#{@view}.jade",   ( err ) => @errorMessage( err ) if err
		fs.unlink utils.paths.stylus + "#{@view}.styl",   ( err ) => @errorMessage( err ) if err
		fs.unlink utils.paths.html   + "#{@view}.html",   ( err ) => @errorMessage( err ) if err

	deleteRoute: ->

		# Read the data from the routes.coffee file
		fs.readFile utils.paths.routes, ( err, data ) =>

			# Get the route for the given view and remove it
			data = data.toString().replace utils.routeTemplate( @view, @route ), ''
			
			fs.writeFile utils.paths.routes, data

	errorMessage: ( error ) ->

		console.log "It looks like #{error.path} wasn't found..."

module.exports = ViewDeleter