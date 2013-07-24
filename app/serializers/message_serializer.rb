class MessageSerializer < ActiveModel::Serializer
  attributes :id, :time, :author_email, :body

  def time
    object.created_at.strftime("%H:%M")
  end

  def author_email
    object.author.email
  end
end
