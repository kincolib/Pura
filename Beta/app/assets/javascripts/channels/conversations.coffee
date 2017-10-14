$(document).ready ->
	messages = $('messages')
	if $('#messages').length > 0

	App.global_conversation = App.cable.subscriptions.create {
		channel: "ConversationsChannel"
		conversation_id: conversation-form.data('conversation-id')
	},

		connected: ->
		# Called when the subscription is ready for use on the server

		disconnected: ->
		# Called when the subscription has been terminated by the server

		received: (data) ->
		# Data received

		send_message: (message, conversation_id) ->
		@perform 'send_message', message: message, conversation_id: conversation_id

		$('#new_message').submit (e) ->
		$this = $(this)
		textarea = $this.find('#message_content')
		if $.trim(textarea.val()).length > 1
			App.global_conversation.send_message.textarea.val(), messages.data('conversation-id')
			textarea.val('')
		e. preventDefault()
		return false

