class Reply < ApplicationRecord
  belongs_to :author, polymorphic: true
  belongs_to :post
end
