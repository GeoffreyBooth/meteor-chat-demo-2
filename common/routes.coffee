Router.onBeforeAction ->
	if Meteor.userId()
		@next()
	else
		@render 'login'


Router.route '/', ->
	@render 'chat'