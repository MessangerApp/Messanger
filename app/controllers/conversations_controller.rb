class ConversationsController < FayeRails::Controller
  observe Conversation, :after_create do |new_con|
    client = Faye::Client.new('http://localhost:3000/faye')
    ConversationsController.publish('/conversations', new_con.attributes)
  end

  channel '/conversations' do
   monitor :subscribe do
     puts "Client #{client_id} subscribed to #{channel}."
   end
   monitor :unsubscribe do
     puts "Client #{client_id} unsubscribed from #{channel}."
   end
   monitor :publish do
     puts "Client #{client_id} published #{data.inspect} to #{channel}."
   end
 end
end
