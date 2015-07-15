program = require 'commander'
fs      = require 'fs'

class CLI
	
	view: null

	constructor: ->

		do @commands

	commands: ->

		program.version '0.1.1'

		# Generate a new View & Route
		program
			.command( 'gen [view]' )
			.description( 'Generate a new View & Route' )
			.action ( view ) => @generate_view( view )

		# Delete a specific View and Route
		program
			.command( 'del [view]' )
			.description( 'Delete an existing View & Route' )
			.action ( view ) => @delete_view( view )

		# Fired if command is not recognized
		program
			.command( '*' )
			.action ( env ) ->
				console.log env + ' is not a valid command...'

		program.parse process.argv

	###
	GENERATE VIEW
	###
	generate_view: ( view ) ->

		# Only continue if the views name is actually passed
		unless view then return console.log 'Please give your view a name: app gen [view_name]'
		
		@view = view.toLowerCase()

		# Generate files needed for the new View
		fs.open 'src/coffee/controllers/' + @view + '.coffee', 'w'
		fs.open 'src/stylus/views/'       + @view + '.styl'  , 'w'
		fs.open 'src/jade/views'          + @view + '.jade'  , 'w'

		# Generate Model from mvc template
		fs.readFile 'cli/mvc/controller.coffee', ( err, data ) =>
			fs.writeFile "src/coffee/controllers/#{@view}.coffee", @generate_data data
		
		# Generate Jade from data below
		fs.writeFile "src/jade/views/#{@view}.jade", do @jade_data

		# Generate Stylus from data below
		fs.writeFile "src/stylus/views/#{@view}.styl", do @stylus_data

		# Read the routes.xml file
		fs.readFile 'src/coffee/routes/routes.coffee', ( err, data ) =>
			
			# # Write in the new data with removed line to the file
			# fs.writeFile 'src/coffee/routes/routes.coffee', data
			
			# Append the new Route to the routes.xml file and reinsert the last line
			fs.appendFile 'src/coffee/routes/routes.coffee', do @route_data
		
		# Success Log
		console.log 'Generated ' + view + ' view'

	generate_data: ( data ) =>
		# Replace keyword in template with View name and capitalize
		return data.toString().replace /<view>/g, @capitalize()

	capitalize: ->
		# Make string capitalized because thats how ngclassify works...
		return @view.charAt( 0 ).toUpperCase() + @view.slice( 1 )

	###
	DELETE VIEW
	###
	delete_view: ( view ) ->

		# Only continue if the views name is actually passed
		unless view then return console.log 'Please pass the name of the view you wish to delete: app del [view_name]'
			
		@view = view.toLowerCase()

		# Delete all the files that match the View passed from the command line
		fs.unlink 'src/coffee/controllers/' + @view + '.coffee'
		fs.unlink 'src/stylus/views/'       + @view + '.styl'
		fs.unlink 'src/jade/views'          + @view + '.jade'

		# Read the data from the routes.coffee file
		fs.readFile 'src/coffee/routes/routes.coffee', ( err, data ) =>

			# Get the Route that matches the given View and remove it from the file
			data = data.toString().replace @route_data(), ''
			
			fs.writeFile 'src/coffee/routes/routes.coffee', data

		# Success Log
		console.log 'Deleted ' + @view + ' view'

	###
	TEMPLATES
	###
	route_data: ->

		data = "
		\r\n
		\r\n			.when '/#{@view}',
		\r\n				templateUrl : 'templates/views/#{@view}.html'
		\r\n				controller  : '#{@view}Controller'
		"
		return data

	jade_data: ->

		data = "##{@view}.page"

		return data

	stylus_data: ->

		data = "##{@view}
			\r\n	//
		"

		return data

module.exports = new CLI