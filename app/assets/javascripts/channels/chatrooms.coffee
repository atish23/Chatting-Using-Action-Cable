App.chatrooms = App.cable.subscriptions.create "ChatroomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
  	$("[data-behavior='count'][data-chatroom-id='#{data.chatroom_id}']").html('')
  	chatroom_count = $("[data-behavior='messages'][data-chatroom-id='#{data.chatroom_id}']")
  	if chatroom_count.length > 0
  		chatroom_count.append(data.message)
  		console.log(data)
  		if document.hidden
  			if Notification.permission == "granted" 
        	new Notification("Message", {body: "Please Check new Message"})
  	else
  		$("[data-behavior='link-chatroom'][data-chatroom-id='#{data.chatroom_id}']").css("color","red")
  		$("[data-behavior='count'][data-chatroom-id='#{data.chatroom_id}']").append("1")


  send_message: (chatroom_id, message)	->
  	@perform "send_message", {chatroom_id: chatroom_id, body: message}
