class Product < ActiveRecord::Base
	belongs_to :category
	has_many :comments
	validates :name, :description, presence: true
	validates :pricing, presence: true, numericality: { minimum: 0 }
end
