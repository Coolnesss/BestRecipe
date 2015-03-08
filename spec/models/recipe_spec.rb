require 'rails_helper'

describe Recipe do
  it "has correct name" do
    recipe = Recipe.new name: "Pork with Ham"

    expect(recipe.name).to eq("Pork with Ham")
  end
end
