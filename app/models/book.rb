class Book < ApplicationRecord
  belongs_to :user
   attachment :image
   validates :shop_name, presence: true
   validates :caption, presence: true
end
