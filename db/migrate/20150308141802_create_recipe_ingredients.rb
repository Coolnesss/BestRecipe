class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.decimal :amount, :precision => 5, :scale => 2

      t.timestamps null: false
    end
  end
end
