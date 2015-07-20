program   = require 'commander'
MkView    = require './tasks/mk_view'
RmView    = require './tasks/rm_view'

class CLI

	constructor: ->

		program.version '0.0.1'

		# Generate a new View & Route
		program
			.command( 'mk-view [name] [route]' )
			.description( 'Generate a new View & Route' )
			.action ( name, route ) => new MkView( name, route )

		# Delete a specific View and Route
		program
			.command( 'rm-view [name] [route]' )
			.description( 'Delete an existing View & Route' )
			.action ( name, route ) => new RmView( name, route )

		# Fired if command is not recognized
		program
			.command( '*' )
			.action ( env ) ->
				console.log env + ' is not a valid command...'

		program.parse process.argv

module.exports = new CLI