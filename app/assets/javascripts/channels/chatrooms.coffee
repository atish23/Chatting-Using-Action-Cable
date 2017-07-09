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
  	else
  		$("[data-behavior='link-chatroom'][data-chatroom-id='#{data.chatroom_id}']").css("color","red")
  		$("[data-behavior='count'][data-chatroom-id='#{data.chatroom_id}']").append("1")