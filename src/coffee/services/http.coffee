class HTTP extends Factory

	constructor: ( $http ) ->

		return {

			get: ( url ) ->

				promise = $http.get( url ).then ( response ) ->
					
					return response.data

				return promise

		}