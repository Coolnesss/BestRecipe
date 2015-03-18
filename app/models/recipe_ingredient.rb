class RecipeIngredient < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :recipe

  def self.massCreate(args)
    args.each{|z, y| RecipeIngredient.create(recipe_id:z, ingredient_id:y)}
  end

end
