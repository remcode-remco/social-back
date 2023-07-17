# app/serializers/user_serializer.rb
class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :location_name, :location_postcode

  # has_many :posts
  # has_many :replies
  # belongs_to :location


  ### FIXEN !! in een call stoppen
  def location_name
    Location.find(object.location_id).name
  end
  def location_postcode
    Location.find(object.location_id).postcode
  end
end
