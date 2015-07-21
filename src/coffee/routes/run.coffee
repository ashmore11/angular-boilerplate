class Run extends Run

	constructor: ( $rootScope ) ->

		defaults =
			title         : 'Page Needs Title!'
			ogTitle       : ''
			ogUrl         : ''
			ogType        : ''
			ogImage       : ''
			ogDescription : ''
			ogSiteName    : 'site name'

		$rootScope.$on '$routeChangeSuccess', ( event, next, current ) ->

			setTitle = setInterval ->

				if next.scope

					if next.scope.data?.meta

						$rootScope.meta = next.scope.data.meta

					else

						$rootScope.meta = defaults

					clearInterval setTitle

			, 100

