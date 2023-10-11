class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  validates :quantity, presence: true
  validates :recipe_id, presence: true
  validates :food_id, presence: true
end
