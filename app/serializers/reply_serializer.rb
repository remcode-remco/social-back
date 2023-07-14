# app/serializers/reply_serializer.rb
class ReplySerializer < ActiveModel::Serializer
  attributes :id, :content, :updated_at, :author

  has_many :keywords

  def author
    if object.author_type == 'User'
      UserSerializer.new(User.find(object.author_id))
    else
      PageSerializer.new(Page.find(object.author_id))
    end
  end
end
