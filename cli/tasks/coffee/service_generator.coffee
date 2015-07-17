fs    = require 'fs'
utils = require './utils.js'

class ServiceGenerator

	paths :
		templates : 'cli/templates/'
		services  : 'src/coffee/services/'

	constructor: ( name ) ->

		message = 'Please give your service a name: ngapp gen [service_name]'

		# Only continue if the views name and route exist
		return console.log message unless name

		console.log 'Generating service...'
		
		@name = name.toLowerCase()

		@generateFile()
		@populateFile()
		
		# Success Log
		console.log "Generated service: [ #{@name} ]"

	generateFile: ->

		# Generate files needed for the new View
		fs.open @paths.services + "#{@name}.coffee", 'w'

	populateFile: ->

		# Generate controller from template
		fs.readFile @paths.templates + 'service.coffee', ( err, data ) =>

			fs.writeFile @paths.services + "#{@name}.coffee", utils.generateData( @name, data )

module.exports = ServiceGenerator