class Routes extends Config

	constructor: ( $locationProvider, $routeProvider ) ->

		$locationProvider.html5Mode true

		$routeProvider

			.when '/',
				templateUrl : 'templates/views/home.html'
				controller  : 'homeController'
 
			.otherwise 
				templateUrl : 'templates/views/404.html' 
				controller  : 'notFound404Controller'