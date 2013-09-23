window.h5media = (selector) ->
	return new mediaObj(selector)

mediaObj = (selector) ->
	this.selector = selector
	this.stream = null
	return this

mediaObj.prototype =

	hasGetUserMedia: () ->
		return navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigatoroGetUserMedia || navigator.msieGetUserMedia || false

	openVideo: () ->
		th = this
		if this.hasGetUserMedia(this.selector)
			navigator.getUserMedia = this.hasGetUserMedia(this.selector)
			navigator.getUserMedia(
				# constraints
				{video: true},

				# successCallback
				(mediaStream) ->
					th.selector.src = window.URL.createObjectURL(mediaStream)
					th.stream = mediaStream
					return th

				# errorCallback
				(error) ->
					return error
			)
		else
			return false
		
		return true

	pauseVideo: () ->
		console.log this
		this.selector.pause();
		this.stream.stop();