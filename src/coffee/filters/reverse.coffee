class Reverse extends Filter

	constructor: ->

	  return ( $items ) ->

	    return $items.slice().reverse()