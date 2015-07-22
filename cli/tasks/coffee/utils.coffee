class Utils

	paths :
		templates  : 'cli/templates/'
		controller : 'src/coffee/controllers/views/'
		service    : 'src/coffee/services/'
		jade       : 'src/jade/views/'
		stylus     : 'src/stylus/views/'
		stylusApp  : 'src/stylus/app.styl'
		routes     : 'src/coffee/config/routes.coffee'
		html       : 'public/templates/views/'

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

	stylusApp: ( name ) ->

		data = "
		\r\n@import 'views/#{name}'
		"

		return data

module.exports = new Utils