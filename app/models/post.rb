class Post < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :replies
  has_many :post_keywords
  has_many :keywords, through: :post_keywords
end
