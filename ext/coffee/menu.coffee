imageUploader = new ImageUploader()

showPageLibrary = ->
  w = 440
  h = 220
  left = (screen.width/2)-(w/2)
  top = (screen.height/2)-(h/2)
  
  chrome.windows.create 
    url: 'gallery.html'
    type: 'popup'
    width: w
    height: h
    left: left
    top: top

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
