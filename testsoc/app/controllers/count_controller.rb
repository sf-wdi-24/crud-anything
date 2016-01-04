class CountController < WebsocketRails::BaseController
  def hello
   
    @count = "hi"
    WebsocketRails[:updates].trigger(:update, @count)
  end

  def goodbye

    @count = "bye"
    WebsocketRails[:updates].trigger(:update, @count)
  end
end

