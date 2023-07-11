class LocationSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :postcode, :name

  has_many :users
  has_many :posts
end
