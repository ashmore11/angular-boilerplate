class Run extends Run

	constructor: ( $rootScope, HTTP ) ->

		$rootScope.$on "$routeChangeSuccess", ( event, next, current ) ->

			setTitle = setInterval ->

				if next.scope

					if next.scope.data?.meta

						meta = next.scope.data.meta

						$rootScope.meta =
							pageTitle : meta.title
							ogTitle   : meta.ogTitle

					else

						$rootScope.meta =
							pageTitle : 'Page Needs Title!'
							ogTitle   : 'Page Needs Title!'

					clearInterval setTitle

			, 100

