# app/serializers/post_serializer.rb
class PostSerializer < ActiveModel::Serializer
  attributes :id, :content

  belongs_to :user
  belongs_to :location
  has_many :replies
  has_many :keywords
end
