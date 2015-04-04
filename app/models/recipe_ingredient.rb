class RecipeIngredient < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :recipe

  def self.massCreate(recipe_id, ingredients)
    ingredients.each{|x| RecipeIngredient.create(recipe_id:recipe_id, ingredient_id:x)}
  end

end
