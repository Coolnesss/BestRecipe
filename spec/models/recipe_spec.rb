require 'rails_helper'

describe Recipe do
  it "has correct name" do
    recipe = Recipe.create name: "Pork with Ham"

    expect(recipe.name).to eq("Pork with Ham")
  end

  it "has correct description" do
    recipe = Recipe.create(name: "Pork with Ham", description: "Amazing")

    expect(recipe.description).to eq("Amazing")
  end

  it "cannot be saved without name" do
    recipe = Recipe.create(description:"Amazing")

    expect(Recipe.count).to eq(0)
  end
end
