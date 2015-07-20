class Examplepage extends Controller

	constructor: ( @$scope ) ->

		@$scope.controller = @

		@$scope.$parent.pageTitle = 'Example page'