class ConvMessagesController < ApplicationController

  def create
    @conversation = Conversation.find_by_id permitted_parameters[:conversation_id]
    @conv_message = ConvMessage.create permitted_parameters

    ConversationChannel.broadcast_to @conversation, @conv_message
  end

  protected
  def permitted_parameters
    params.require(:conv_message).permit(:message, :conversation_id)
  end

end
