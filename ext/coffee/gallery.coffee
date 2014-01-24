$.ajax
	url:'http://198.199.115.150:4000/api/images'
.done (data) ->
	images = data.images
	imagesData = (image.srcUrl for image in images)

	$.fancybox imagesData
	  ,
	  'padding'     : 0,
	  'transitionIn'    : 'none',
	  'transitionOut'   : 'none',
	  'type'              : 'image',
	  'changeFade'        : 0