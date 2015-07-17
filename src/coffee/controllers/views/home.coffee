class Home extends Controller

	constructor: ( @$scope, @HTTP ) ->

		@$scope.controller = @

		@HTTP.get( './json/data.json' ).then ( data ) =>

			@$scope.data = data.pages.HOME