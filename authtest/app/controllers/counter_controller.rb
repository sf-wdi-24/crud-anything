class CounterController < WebsocketRails::BaseController

def current
	@message = Message.last.line
	WebsocketRails[:updates].trigger(:update, @message)
end
