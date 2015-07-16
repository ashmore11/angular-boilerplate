program = require 'commander'
fs      = require 'fs'

class CLI
	
	view : null
	route: null

	constructor: ->

		do @commands

	commands: ->

		program.version '0.1.1'

		# Generate a new View & Route
		program
			.command( 'gen [view] [route]' )
			.description( 'Generate a new View & Route' )
			.action ( view, route ) => @generateView( view, route )

		# Delete a specific View and Route
		program
			.command( 'del [view] [route]' )
			.description( 'Delete an existing View & Route' )
			.action ( view, route ) => @deleteView( view, route )

		# Fired if command is not recognized
		program
			.command( '*' )
			.action ( env ) ->
				console.log env + ' is not a valid command...'

		program.parse process.argv

	###
	GENERATE VIEW
	###
	generateView: ( view, route ) ->

		# Only continue if the views name is actually passed
		unless view and route then return console.log 'Please give your view a name and route: app gen [view_name] [route_name]'
		
		@view  = view.toLowerCase()
		@route = route.toLowerCase()

		# Generate files needed for the new View
		fs.open 'src/coffee/controllers/' + @view + '.coffee', 'w'
		fs.open 'src/stylus/views/'       + @view + '.styl'  , 'w'
		fs.open 'src/jade/views/'         + @view + '.jade'  , 'w'

		# Generate Model from mvc template
		fs.readFile 'cli/mvc/controller.coffee', ( err, data ) =>
			fs.writeFile "src/coffee/controllers/views/#{@view}.coffee", @generateData data
		
		# Generate Jade from data below
		fs.writeFile "src/jade/views/#{@view}.jade", do @jadeData

		# Generate Stylus from data below
		fs.writeFile "src/stylus/views/#{@view}.styl", do @stylusData
	
		fs.readFile 'src/coffee/routes/routes.coffee', ( err, data ) =>

			data = data.toString().replace @route404(), ''

			# Write in the new data with removed 404 route
			fs.writeFile 'src/coffee/routes/routes.coffee', data
			
			# Append the new route
			fs.appendFile 'src/coffee/routes/routes.coffee', @routeData()

			# Reinsert the removed 404 route
			fs.appendFile 'src/coffee/routes/routes.coffee', @route404()
		
		# Success Log
		console.log 'Generated ' + view + ' view'

	generateData: ( data ) =>
		# Replace keyword in template with View name and capitalize
		return data.toString().replace /<view>/g, @capitalize()

	capitalize: ->
		# Make string capitalized because thats how ngclassify works...
		return @view.charAt( 0 ).toUpperCase() + @view.slice( 1 )

	###
	DELETE VIEW
	###
	deleteView: ( view, route ) ->

		# Only continue if the views name is actually passed
		unless view and route then return console.log 'Please pass the name and route of the view you wish to delete: app del [view_name] [route_name]'
			
		@view  = view.toLowerCase()
		@route = route.toLowerCase()

		# Delete all the files that match the View passed from the command line
		fs.unlink 'src/coffee/controllers/views/' + @view + '.coffee'
		fs.unlink 'src/stylus/views/'             + @view + '.styl'
		fs.unlink 'src/jade/views/'               + @view + '.jade'
		fs.unlink 'public/templates/views/'       + @view + '.html'

		# Read the data from the routes.coffee file
		fs.readFile 'src/coffee/routes/routes.coffee', ( err, data ) =>

			# Get the route for the given view and remove it
			data = data.toString().replace @routeData(), ''
			
			fs.writeFile 'src/coffee/routes/routes.coffee', data

		# Success Log
		console.log 'Deleted ' + @view + ' view'

	###
	TEMPLATES
	###
	routeData: ->

		data = "
		\r\n
		\r\n			.when '/#{@route}',
		\r\n				templateUrl : 'templates/views/#{@view}.html'
		\r\n				controller  : '#{@view}Controller'
		"
		return data

	route404: ->

		data = "
		\r\n
		\r\n			.otherwise
		\r\n				templateUrl : 'templates/views/404.html'
		\r\n				controller  : 'notFound404Controller'
		"
		return data

	jadeData: ->

		data = "##{@view}.page
		\r\n
		\r\n	h1 #{@view.toUpperCase()}
		"

		return data

	stylusData: ->

		data = "##{@view}
		\r\n	//
		"

		return data

module.exports = new CLI