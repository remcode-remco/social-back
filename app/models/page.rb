class Page < ApplicationRecord
  belongs_to :user
  belongs_to :pagetype
  belongs_to :location
  has_many :posts, as: :postable
end
