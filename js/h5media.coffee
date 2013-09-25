window.H5media = (selector) ->
	return new mediaObj(selector)

mediaObj = (selector) ->
	this.selector = selector
	this.stream = null
	this.currSpeach = null
	this.selector.addEvent = (ev_type, fn, bool) ->
		addEvent = if document.addEventListener then this.addEventListener(ev_type, fn, bool) else this.attachEvent("on" + ev_type, fn)
		return this
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
					th.selector.src = (window.URL || window.webkitURL).createObjectURL(mediaStream)
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
		this.selector.pause();
		this.stream.stop();

	resumeVideo: () ->
		this.openVideo()

	closeVideo: () ->
		this.pauseVideo()
		this.selector.src = ""

	shotTo: (img) ->
		console.dir this.selector
		canvas = document.querySelector("#screenshot-canvas")
		ctx = canvas.getContext('2d')
		canvas.width = this.selector.width
		canvas.height = this.selector.height
		ctx.drawImage(this.selector, 0, 0, this.selector.width, this.selector.height)
		img.src = canvas.toDataURL()

	speach: () ->
		this.selector.addEvent("webkitspeechchange", (event) ->
			this.currSpeach = event.results[0].utterance
		)


