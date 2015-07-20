class Home extends Controller

	constructor: ( @$rootScope, @$scope, @HTTP, @imageLoaderService ) ->

		@$scope.controller   = @

		@HTTP.get( './json/data.json' ).then ( data ) =>

			@$scope.data = data.pages.HOME

			@loadImages()

	# Simple example to load a set of images and 
	# set a flag to true when the set is loaded
	loadImages: ->

		images = []

		for asset in @$scope.data.assets

			if asset.type is 'image'

				images.push asset.src

		@imageLoaderService.loadSet images, =>

			@$scope.imagesLoaded = true