class Category < ActiveRecord::Base

  has_many :products

  # validates :name, prescence: true;

end
