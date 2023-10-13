class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods, dependent: :destroy

  validates :name, presence: true
  validates :preparation_time, numericality: { greater_than: 0 }
  validates :cooking_time, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :user_id, presence: true
end
