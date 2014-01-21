class ImageUploader
	url = 'http://si-dev.com:4000/'
	
	showImages =(e) ->
		json = JSON.parse(e.target.responseText)

		images = json.images
		for image in images
			img = document.createElement('img')
			img.src = image.srcUrl
			document.body.appendChild(img)

	message = (response) ->
		console.log('response', response)

	addImage: (image)->
		data = {srcUrl:image.srcUrl}
		req = new XMLHttpRequest()
		req.open("POST", url)
		req.setRequestHeader("Content-Type", "application/json;charset=UTF-8")
		req.onload = message.bind(this)
		req.send(JSON.stringify(data))

	list: ->
		req = new XMLHttpRequest()
		req.open("GET", url, true)
		req.onload = showImages.bind(this)
		req.send(null)