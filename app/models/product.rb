class Product < ActiveRecord::Base
  attr_accessible :name, :price, :category_id
  has_paper_trail
	belongs_to :category
end
