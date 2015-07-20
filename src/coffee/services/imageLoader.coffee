class ImageLoader extends Service

	constructor: ( $rootScope ) ->

		@load = ( src ) ->

			dfd = $.Deferred()
			img = new Image()

			img.onload = =>

				dfd.resolve img

			img.src = src

			dfd

		@loadSet = ( set, done ) =>

			loaders = []
			count   = 0

			for i in set
				
				loaders.push @load( i ).promise().done ->

					count++

					if count is set.length

						done?()

			$.when.apply null, loaders