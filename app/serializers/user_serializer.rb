# app/serializers/user_serializer.rb
class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :location_city, :location_postcode

  # has_many :posts
  # has_many :replies
  # belongs_to :location

  def location_city
    Location.find(object.location_id).name
  end
  def location_postcode
    Location.find(object.location_id).postcode
  end
end
