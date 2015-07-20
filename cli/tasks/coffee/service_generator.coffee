fs    = require 'fs'
utils = require './utils.js'

class ServiceGenerator

	constructor: ( type, name ) ->

		message = 'Please give your service a type and name: ngapp gen-service [service_type] [service_name]'

		# Only continue if the services type and name exist
		return console.log message unless type and name

		console.log 'Generating service...'
		
		@type = type.toLowerCase()
		@name = name.toLowerCase()

		@generateFile()
		@populateFile()
		
		# Success Log
		console.log "Generated service: [ #{@name} ]"

	generateFile: ->

		# Generate files needed for the new View
		fs.open utils.paths.services + "#{@name}.coffee", 'w'

	populateFile: ->

		# Generate controller from template
		fs.readFile utils.paths.templates + "#{@type}.coffee", ( err, data ) =>

			fs.writeFile utils.paths.services + "#{@name}.coffee", utils.generateTemplate( @name, data )

module.exports = ServiceGenerator