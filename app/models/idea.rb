class Idea < ApplicationRecord

  validates :body, :category_id, :null => false
  belongs_to :category

end
