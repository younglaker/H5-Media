window.h5media = (selector) ->
	return new mediaObj(selector)

mediaObj = (selector) ->
	this.selector = document.querySelector(selector)
	return this

mediaObj.prototype =
	hasGetUserMedia: () ->
		return navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigatoroGetUserMedia || navigator.msieGetUserMedia || false

	openVideo: () ->
		selector = this.selector
		if this.hasGetUserMedia(this.selector)
			navigator.getUserMedia = this.hasGetUserMedia(this.selector)
			navigator.getUserMedia(
				# constraints
				{video: true},

				# successCallback
				(mediaStream) ->
					selector.src = window.URL.createObjectURL(mediaStream)

				# errorCallback
				(error) ->
					return error
			)
		else
			return false
		
		return true

	pauseVideo: (container) ->
		container.pause();