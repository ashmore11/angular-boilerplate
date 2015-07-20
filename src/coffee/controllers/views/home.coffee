class Home extends Controller

	constructor: ( @$scope, @HTTP, @imageLoaderService ) ->

		@$scope.controller = @

		@HTTP.get( './json/data.json' ).then ( data ) =>

			@$scope.data = data.pages.HOME

			@setTitle()
			@loadImages()

	# Set the title of the current page
	setTitle: ->

		@$scope.$parent.pageTitle = @$scope.data.title

	# Simple example to load a set of images and 
	# set a flag to true when the set is loaded
	loadImages: ->

		images = []

		for asset in @$scope.data.assets

			if asset.type is 'image'

				images.push asset.src

		@imageLoaderService.loadSet images, =>

			@$scope.imagesLoaded = true