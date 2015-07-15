class App extends App

	constructor: ->

		# Initialize the app when the DOM is ready
		angular.element( document ).ready () => do @start

		return [ 
			'ngRoute',
			'ngAnimate',
			'ngSanitize'
		]


	start: ->
			
		# Bootstrap Angular
		angular.bootstrap document, [ 'app' ]