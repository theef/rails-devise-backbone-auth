class ExampleProfile.Views.AppIndex extends Backbone.View
	el: '.app-content'
	template: JST['application/index']
	events: 
		'click .sign-out-session' : 'sign_out_session'
	
	initialize: ->
		Backbone.history.navigate '/'
		@.render()

	render: ->
		$(@el).empty
		$(@el).html(@template())
		@
		
		$.ajax '/current_user.json'
			type: 'GET'
			dataType: 'JSON'
			success: (data, textStatus, jqXHR) ->
				if data == 1
					$('.alert-top').html '<div class="alert alert-info">you are signed in <a href="/sign_out" class="sign-out-session" style="float: right;">sign out</a></div>'
		
		new ExampleProfile.Views.UserSession
		
	sign_out_session: ->
		event.preventDefault()
		$.ajax 'users/sign_out'
			type: 'GET'
			dataType: 'JSON'
			success: (data, textStatus, jqXHR) ->
				$('.alert-top').html '<div class="alert alert-warning">you are not signed in</div>'