class ExampleProfile.Views.AppIndex extends Backbone.View
	el: '.app-content'
	template: JST['application/index']
	
	initialize: ->
		Backbone.history.navigate '/'
		@.render()

	render: ->
		$(@el).empty
		$(@el).html(@template())
		@
		
		new ExampleProfile.Views.UserSession