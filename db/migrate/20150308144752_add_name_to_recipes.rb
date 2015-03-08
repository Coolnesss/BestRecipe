class AddNameToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :name, :string
  end
end
