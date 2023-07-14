# app/serializers/post_serializer.rb
class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :updated_at, :author

  belongs_to :location
  has_many :replies
  has_many :keywords

  def author
    if object.postable_type == 'User'
      UserSerializer.new(User.find(object.postable_id))
    else
      PageSerializer.new(Page.find(object.postable_id))
    end
  end
end
