class AddIngredientIdToRecipeIngredients < ActiveRecord::Migration
  def change
    add_column :recipe_ingredients, :ingredient_id, :integer
  end
end
