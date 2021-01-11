class ConvMessage < ApplicationRecord
  belongs_to :conversation

  def as_json(options)
    super(options).merge(user_avatar_url: conversation.sender.gravatar_url)
  end


end
