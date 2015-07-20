class Utils

	paths :
		templates : 'cli/templates/'
		coffee    : 'src/coffee/controllers/views/'
		jade      : 'src/jade/views/'
		stylus    : 'src/stylus/views/'
		routes    : 'src/coffee/routes/routes.coffee'
		html      : 'public/templates/views/'
		services  : 'src/coffee/services/'

	generateTemplate: ( name, data ) =>

		# Replace keyword in template with View name and capitalize
		return data.toString().replace /<name>/g, @capitalize name

	capitalize: ( name ) ->

		# Make string capitalized because thats how ngclassify works...
		return name.charAt( 0 ).toUpperCase() + name.slice( 1 )

	routeTemplate: ( name, route ) ->

		data = "
		\r\n
		\r\n			.when '/#{route}',
		\r\n				templateUrl : 'templates/views/#{name}.html'
		\r\n				controller  : '#{name}Controller'
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

	jadeData: ( name ) ->

		data = "##{name}.page
		\r\n
		\r\n	h1 #{name.toUpperCase()}
		"

		return data

	stylusData: ( name ) ->

		data = "##{name}
		\r\n	//
		"

		return data

module.exports = new Utils