imageUploader = new ImageUploader()

chrome.contextMenus.create
	title: "Add Image"
	contexts: ["image"]
	onclick: imageUploader.addImage