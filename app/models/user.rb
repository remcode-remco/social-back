class User < ApplicationRecord
  belongs_to :location
  has_many :posts, as: :postable
  has_many :replies, as: :author
end
