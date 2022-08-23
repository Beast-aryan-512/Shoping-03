class Product < ApplicationRecord
  belongs_to :user
  validates :name, :discription, :price, presence: true
end
