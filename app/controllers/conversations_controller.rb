class ConversationsController < ActionController::API

  def index
    @conversations = Conversation.where(user_id: current_user.id)
  end

  def initialize_session

  end
end
