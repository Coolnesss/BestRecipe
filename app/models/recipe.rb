class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  belongs_to :user

  validates :name, presence: true
  validates :user, presence: true
end
