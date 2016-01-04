WebsocketRails::EventMap.describe do
  # subscribe :hello, 'counter#hello'
  # subscribe :client_disconnected, 'counter#goodbye'
  # subscribe :connection_closed, 'counter#goodbye'
  subscribe :sent, 'message#create'
end
