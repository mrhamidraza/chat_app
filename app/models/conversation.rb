class Conversation < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"

  has_many :conv_messages

  def self.load_conversation(current_user_id, other_user_id)
    conversation = self.where("(sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)", current_user_id, other_user_id, other_user_id, current_user_id).first
    if conversation.nil?
      conversation = self.create sender_id: current_user_id, receiver_id: other_user_id
    end
    conversation
  end
end
