var ImageUploader;

ImageUploader = (function() {
  var message, showImages, url;

  function ImageUploader() {}

  url = 'http://si-dev.com:4000/';

  showImages = function(e) {
    var image, images, img, json, _i, _len, _results;
    json = JSON.parse(e.target.responseText);
    images = json.images;
    _results = [];
    for (_i = 0, _len = images.length; _i < _len; _i++) {
      image = images[_i];
      img = document.createElement('img');
      img.src = image.srcUrl;
      _results.push(document.body.appendChild(img));
    }
    return _results;
  };

  message = function(response) {
    return console.log('response', response);
  };

  ImageUploader.prototype.addImage = function(image) {
    var data, req;
    data = {
      srcUrl: image.srcUrl
    };
    req = new XMLHttpRequest();
    req.open("POST", url);
    req.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    req.onload = message.bind(this);
    return req.send(JSON.stringify(data));
  };

  ImageUploader.prototype.list = function() {
    var req;
    req = new XMLHttpRequest();
    req.open("GET", url, true);
    req.onload = showImages.bind(this);
    return req.send(null);
  };

  return ImageUploader;

})();
