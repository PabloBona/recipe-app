class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

  validates :name, presence: true
  validates :preparation_time, numericality: { only_integer: true, greater_than: 0 }
  validates :cooking_time, numericality: { only_integer: true, greater_than: 0 }
  validates :description, presence: true
  validates :user_id, presence: true
end
