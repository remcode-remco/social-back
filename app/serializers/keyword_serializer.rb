# app/serializers/keyword_serializer.rb
class KeywordSerializer < ActiveModel::Serializer
  attributes :id, :keyword

  has_many :post_keywords
  has_many :posts, through: :post_keywords
end
