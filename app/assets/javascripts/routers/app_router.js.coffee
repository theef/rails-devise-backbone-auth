class ExampleProfile.Routers.AppRouter extends Backbone.Router
	routes:
		'' : 'index'

	initialize: ->

	index: ->
		new ExampleProfile.Views.AppIndex