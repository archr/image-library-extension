imageUploader = new ImageUploader()

showPageLibrary = ->
  chrome.tabs.executeScript null, 
    file: "vendor/jquery/jquery.js"
  , ->
    chrome.tabs.insertCSS null,
      file: "vendor/fancybox/source/jquery.fancybox.css",
    , ->
      chrome.tabs.executeScript null,
        file: "vendor/fancybox/source/jquery.fancybox.pack.js"
      , () ->
        chrome.tabs.executeScript null,
          file: "js/gallery.js"
        , ->
          console.log('1dsjad')

  # w = 800
  # h = 300
  # left = (screen.width/2)-(w/2)
  # top = 100
  
  # chrome.windows.create 
  #   url: 'gallery.html'
  #   type: 'popup'
  #   width: w
  #   height: h
  #   left: left
  #   top: top

chrome.contextMenus.create
  title: "Save Image"
  contexts: ["image"]
  type: 'normal'
  onclick: imageUploader.addImage

chrome.contextMenus.create
  title: "Show Library"
  contexts: ["page"]
  type: 'normal'
  onclick: showPageLibrary
