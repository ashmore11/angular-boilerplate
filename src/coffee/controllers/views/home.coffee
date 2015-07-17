class Home extends Controller

	constructor: ( @$scope, @HTTP ) ->

		@$scope.controller = @

		url = './json/data.json'

		@HTTP.get( url ).then ( data ) =>

			@$scope.data = data.pages.HOME