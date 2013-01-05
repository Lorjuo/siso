class Product < ActiveRecord::Base
  attr_accessible :name, :price
  has_paper_trail
end
