class MessagesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_chatroom

	def create
		message = @chatroom.messages.new(messages_params)
		message.user = current_user
		message.save!
		MessageDelayJob.perform_later(message)
	end

	private

		def messages_params
			params.require(:message).permit(:body)		
		end
		
		def set_chatroom
			@chatroom = Chatroom.find(params[:chatroom_id])
		end
end
