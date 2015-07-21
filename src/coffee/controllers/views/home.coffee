class Home extends Controller

	constructor: ( @$scope, @HTTP, @imageLoaderService ) ->

		@HTTP.get( './json/data.json' ).then ( data ) =>

			@$scope.data = data.pages.HOME

			@loadImages()

	# Simple example to load a set of images and 
	# set a flag to true when the set is loaded
	loadImages: ->

		images = []

		# Using lodash to iterate through the collection of 
		# assets from our data.json file
		_.forEach @$scope.data.assets, ( asset ) ->

			if asset.type is 'image'

				images.push asset.src

		@imageLoaderService.loadSet images, =>

			@$scope.imagesLoaded = true