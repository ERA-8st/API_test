class Category < ApplicationRecord

  varidates :name, :null => false
  has_many :ideas

end
