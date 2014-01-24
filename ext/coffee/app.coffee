GalleryController = ($scope, $http)->
   $http
      url: 'http://198.199.115.150:4000/api/images'
      method: 'GET'
    .success (data) ->
      if data.success
        $scope.images = data.images
        #$('.fancybox').fancybox();
        $.fancybox [
          'http://farm5.static.flickr.com/4044/4286199901_33844563eb.jpg',
          'http://farm3.static.flickr.com/2687/4220681515_cc4f42d6b9.jpg',
          ]
          ,
          'padding'     : 0,
          'transitionIn'    : 'none',
          'transitionOut'   : 'none',
          'type'              : 'image',
          'changeFade'        : 0
        
    .error (data, status) ->
      alert(status)


