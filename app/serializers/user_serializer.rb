# app/serializers/user_serializer.rb
class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  has_many :posts
  has_many :replies
  belongs_to :location
end
