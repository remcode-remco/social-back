# app/serializers/post_keyword_serializer.rb
class PostKeywordSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :post
  belongs_to :keyword
end
