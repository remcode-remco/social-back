class Location < ApplicationRecord
  belongs_to :country
  has_many :users
  has_many :posts

  scope :within_radius, lambda { |latitude, longitude, metres|
    where("earth_box(ll_to_earth(?, ?), ?) @> ll_to_earth(latitude, longitude)", latitude, longitude, metres)
  }
end
