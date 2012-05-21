window.ExampleProfile =
	Models: {}
	Collections: {}
	Views: {}
	Routers: {}
	init: ->
		new ExampleProfile.Routers.AppRouter
		Backbone.history.start({pushState: true})

$(document).ready ->
	ExampleProfile.init()
