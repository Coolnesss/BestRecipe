require 'rails_helper'

describe Ingredient do
  it "has correct name" do
    recipe = Recipe.create name: "Juice"

    expect(recipe.name).to eq("Juice")
  end

  it "cannot be saved without name" do
    recipe = Recipe.create()

    expect(Recipe.count).to eq(0)
  end
end
