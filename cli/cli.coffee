program    = require 'commander'
viewGen    = require './tasks/view_generator.js'
viewDel    = require './tasks/view_deleter.js'
serviceGen = require './tasks/service_generator.js'

class CLI
	
	view  : null
	route : null

	paths :
		templates : 'cli/templates/'
		coffee    : 'src/coffee/controllers/views/'
		jade      : 'src/jade/views/'
		stylus    : 'src/stylus/views/'
		routes    : 'src/coffee/routes/routes.coffee'
		html      : 'public/templates/views/'

	constructor: ->

		program.version '0.1.1'

		# Generate a new View & Route
		program
			.command( 'gen-view [view] [route]' )
			.description( 'Generate a new View & Route' )
			.action ( view, route ) => new viewGen( view, route )

		# Delete a specific View and Route
		program
			.command( 'del-view [view] [route]' )
			.description( 'Delete an existing View & Route' )
			.action ( view, route ) => new viewDel( view, route )

		# Generate a new Service
		program
			.command( 'gen-service [name]' )
			.description( 'Generate a new Service' )
			.action ( name ) => new serviceGen( name )

		# Fired if command is not recognized
		program
			.command( '*' )
			.action ( env ) ->
				console.log env + ' is not a valid command...'

		program.parse process.argv

module.exports = new CLI