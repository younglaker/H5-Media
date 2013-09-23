
	window.h5media =
		video:
			hasGetUserMedia: (container) ->
				HGetUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigatoroGetUserMedia || navigator.msieGetUserMedia || false

			openCamera: (container) ->
				if h5media.video.hasGetUserMedia(container)
					navigator.getUserMedia = h5media.video.hasGetUserMedia(container)
					navigator.getUserMedia(
						# constraints
						{video: true},

						# successCallback
						(mediaStream) ->
							container.src = window.URL.createObjectURL(mediaStream)

						# errorCallback
						(error) ->
							return error
					)
				else
					return false
				
				return true