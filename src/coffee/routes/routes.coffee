class Routes extends Config

	constructor: ( $locationProvider, $routeProvider ) ->

		$locationProvider.html5Mode true

		$routeProvider

			.when '/',
				templateUrl : 'templates/views/home.html'
				controller  : 'homeController'
 
			.when '/example-page', 
				templateUrl : 'templates/views/examplepage.html' 
				controller  : 'examplepageController'
 
			.when '/test', 
				templateUrl : 'templates/views/del.html' 
				controller  : 'delController'
 
			.otherwise 
				templateUrl : 'templates/views/404.html' 
				controller  : 'notFound404Controller'