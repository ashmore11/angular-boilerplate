program    = require 'commander'
viewGen    = require './tasks/view_generator.js'
viewDel    = require './tasks/view_deleter.js'
serviceGen = require './tasks/service_generator.js'

class CLI

	constructor: ->

		program.version '0.0.1'

		# Generate a new View & Route
		program
			.command( 'gen-view [name] [route]' )
			.description( 'Generate a new View & Route' )
			.action ( name, route ) => new viewGen( name, route )

		# Delete a specific View and Route
		program
			.command( 'del-view [name] [route]' )
			.description( 'Delete an existing View & Route' )
			.action ( name, route ) => new viewDel( name, route )

		# Generate a new Service or Factory
		program
			.command( 'gen-service [type] [name]' )
			.description( 'Generate a new Service' )
			.action ( type, name ) => new serviceGen( type, name )

		# Fired if command is not recognized
		program
			.command( '*' )
			.action ( env ) ->
				console.log env + ' is not a valid command...'

		program.parse process.argv

module.exports = new CLI