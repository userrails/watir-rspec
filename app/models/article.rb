class Article < ActiveRecord::Base
  validates :name, :address, :presence => true
end