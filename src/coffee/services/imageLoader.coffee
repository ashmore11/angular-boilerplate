class ImageLoader extends Service

	constructor: ->

		@load = ( src ) ->

			dfd = $.Deferred()
			img = new Image()

			img.onload = =>
				
				dfd.resolve img

			img.src = src

			dfd

		@loadSet = ( set ) ->

			loaders = []

			loaders.push ImageLoader.load( i ).promise() for i in set

			$.when.apply null, loaders