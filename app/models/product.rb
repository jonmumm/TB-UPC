class Product < ActiveRecord::Base
  attr_accessible :upc, :name

  validates_presence_of :upc, :name
end
