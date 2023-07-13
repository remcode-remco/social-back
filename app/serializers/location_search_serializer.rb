class LocationSearchSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :postcode, :name
end
