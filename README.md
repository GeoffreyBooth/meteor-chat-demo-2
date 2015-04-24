## Meteor Chat App Tutorial, Part 2

See https://github.com/DiegeticShadow/meteor-chat-demo-1 for Part 1.

### Add accounts

```
meteor add accounts-password
meteor add useraccounts:bootstrap
```
##### common/accountsTemplates.coffee
```
AccountsTemplates.addField
	_id: 'username'
	type: 'text'
	displayName: 'Username'
	required: yes
```

### Add Iron Router

```
meteor add iron:router
```
##### common/routes.coffee

```
Router.onBeforeAction ->
	if Meteor.userId()
		@next()
	else
		@render 'login'

Router.route '/', ->
	@render 'chat'
```

### Restructure templates to use routes, add username field

Delete the `body` block in **index.html**.

##### login.html
```
<template name="login">
	{{> atForm}}
</template>
```

##### chat.html
```
<template name="chat">
	<div id="chat">
		<div id="messages">
			{{#each getMessages}}
				<p><strong>{{username}}</strong>: {{message}}</p>
			{{/each}}
		</div>
	</div>

	<div id="input">
		<form>
			<input type="text" class="form-control">
		</form>
	</div>
</template>
```

##### index.styl
```
.at-form
	max-width 40em
```

##### chat.coffee
```
		Messages.insert
			username: Meteor.user().username
			message: message
			timestamp: Date.now()
```
