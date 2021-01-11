class ConversationsController < ApplicationController
  def index
    @users = User.rest_of_users(current_user)
  end

  def show
    @users = User.rest_of_users(current_user)
    @conversation = Conversation.load_conversation(current_user.id, params[:user_id])
    @conv_message = @conversation.conv_messages.new
    @conv_messages = @conversation.conv_messages.includes(conversation: [:sender, :receiver])
  end
end
