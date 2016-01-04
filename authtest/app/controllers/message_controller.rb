class MessageController < ApplicationController
  def index
  	@messages= Message.all
 end
  def create
  	@message = Message.new(params.require(:message).permit(:line))
  	@message.save
  	WebsocketRails[:updates].trigger(:update, @message)
  	redirect_to message_index_path

  end
end
