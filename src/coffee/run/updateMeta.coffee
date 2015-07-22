class UpdateMeta extends Run

	constructor: ( $rootScope ) ->

		defaults =
			title         : 'Page Needs Title!'
			ogTitle       : 'site title'
			ogUrl         : 'site url'
			ogType        : 'site type'
			ogImage       : 'site image'
			ogDescription : 'site description'
			ogSiteName    : 'site name'

		$rootScope.$on '$routeChangeSuccess', ( event, next, current ) ->

			# Create interval because next.scope doesnt exist immediately
			setTitle = setInterval ->

				if next.scope

					if next.scope.data?.meta

						$rootScope.meta = next.scope.data.meta

					else

						$rootScope.meta = defaults

					# clear the interval once we have our new meta data
					clearInterval setTitle

			, 100

