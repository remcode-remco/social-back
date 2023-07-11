class Keyword < ApplicationRecord
  has_many :post_keywords
  has_many :posts, through: :post_keywords
end
