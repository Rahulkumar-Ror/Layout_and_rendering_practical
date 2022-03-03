class Product < ApplicationRecord
	validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  has_many :orders, dependent: :destroy
end
