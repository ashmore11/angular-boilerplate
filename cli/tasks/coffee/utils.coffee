class Utils

	generateData: ( name, data ) =>

		# Replace keyword in template with View name and capitalize
		return data.toString().replace /<name>/g, @capitalize name

	capitalize: ( name ) ->

		# Make string capitalized because thats how ngclassify works...
		return name.charAt( 0 ).toUpperCase() + name.slice( 1 )

	routeData: ( view, route ) ->

		data = "
		\r\n
		\r\n			.when '/#{route}',
		\r\n				templateUrl : 'templates/views/#{view}.html'
		\r\n				controller  : '#{view}Controller'
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

	jadeData: ( view ) ->

		data = "##{view}.page
		\r\n
		\r\n	h1 #{view.toUpperCase()}
		"

		return data

	stylusData: ( view ) ->

		data = "##{view}
		\r\n	//
		"

		return data

module.exports = new Utils