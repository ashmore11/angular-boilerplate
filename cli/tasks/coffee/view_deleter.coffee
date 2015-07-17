fs    = require 'fs'
utils = require './utils.js'

class ViewDeleter

	paths :
		coffee    : 'src/coffee/controllers/views/'
		jade      : 'src/jade/views/'
		stylus    : 'src/stylus/views/'
		routes    : 'src/coffee/routes/routes.coffee'
		html      : 'public/templates/views/'

	constructor: ( view, route ) ->

		message = 'Please pass the name and route of the view you wish to delete: app del [view_name] [route_name]'

		# Only continue if the views name is actually passed
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
		fs.unlink @paths.coffee + "#{@view}.coffee", ( err ) => @errorMessage( err ) if err
		fs.unlink @paths.jade   + "#{@view}.jade",   ( err ) => @errorMessage( err ) if err
		fs.unlink @paths.stylus + "#{@view}.styl",   ( err ) => @errorMessage( err ) if err
		fs.unlink @paths.html   + "#{@view}.html",   ( err ) => @errorMessage( err ) if err

	deleteRoute: ->

		# Read the data from the routes.coffee file
		fs.readFile @paths.routes, ( err, data ) =>

			# Get the route for the given view and remove it
			data = data.toString().replace utils.routeData( @view, @route ), ''
			
			fs.writeFile @paths.routes, data

	errorMessage: ( error ) ->

		console.log "It looks like #{error.path} wasn't found..."

module.exports = ViewDeleter