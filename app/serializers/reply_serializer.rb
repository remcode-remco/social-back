# app/serializers/reply_serializer.rb
class ReplySerializer < ActiveModel::Serializer
  attributes :id, :content

  belongs_to :user
  belongs_to :post
end
