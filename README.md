# H5-Media

## About

A html5 video plugin, no dependencies. Can open the camera through broswer and take photos. It has CoffeeScript and JavaScript.

## API/Demo

		<video id="camera-area" autoplay ></video> // Basic must
		<img id="screenshot" src=""> // Capture must
		<canvas style="display:none;" id="screenshot-canvas"></canvas> // Capture must
		<div>
			<button id="btn-open">open</button>
			<button id="btn-pause">pause</button>
			<button id="btn-resume">resume</button>
			<button id="btn-close">close</button>
			<button id="btn-shot">shot</button>
		</div>

- new H5media(DOMElement);
		
		var video = document.querySelector("#camera-area");
		var obj = new H5media(video);

- openVideo()

		obj.openVideo();

- resumeVideo()

		obj.resumeVideo();

- closeVideo()

		obj.closeVideo();

- shotTo(DOMElement);

		var shot = document.querySelector("#btn-shot");
		screenshot = document.querySelector("#screenshot");
		obj.shotTo(screenshot);

## Changelog:

### Version 1.0 (2013.09.25)
> Can open the camera through broswer and take photos.