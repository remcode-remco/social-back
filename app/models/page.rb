class Page < ApplicationRecord
  belongs_to :user
  belongs_to :page_type
  belongs_to :location
  has_many :posts, as: :postable
  has_many :replies, as: :author
end
