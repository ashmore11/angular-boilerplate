class Routes extends Config

	constructor: ( $locationProvider, $routeProvider ) ->

		$locationProvider.html5Mode true

		$routeProvider

			.otherwise
				templateUrl : 'templates/views/home.html'
				controller  : 'homeController'

			.when '/',
				templateUrl : 'templates/views/home.html'
				controller  : 'homeController'