class ExampleProfile.Views.UserSession extends Backbone.View
	
	_modelBinder: undefined
	
	el: '.login-area'
	template: JST['user/user_session']
	events:
		'submit form' : 'login'
		'click .cancel-login' : 'cancel'
	
	initialize: ->
		@modelBinder = new Backbone.ModelBinder
		@model = new ExampleProfile.Models.UserSession
		@.render()

	render: ->
		$(@el).empty
		$(@el).html(@template())
		@
		
		bindings = {
			email: '#email'
			password: '#password'
		}
		@modelBinder.bind(@model, @el, bindings)

	login: (event) ->
		event.preventDefault()
		@model.save(
			@model.attributes
			success: (userSession, response) ->
				console.log(response)
				currentUser = new ExampleProfile.Models.User()
				$('.alert-top').html '<div class="alert alert-info">you are signed in <a href="/sign_out" class="sign-out-session" style="float: right;">sign out</a></div>'
			error: (xhr, userSession, response) ->
				result = $.parseJSON(response.responseText)
		)
		
	cancel: (event) ->
		event.preventDefault()