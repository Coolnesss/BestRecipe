require 'rails_helper'

describe "Recipes page" do
  it "should not have any before been created" do
    visit recipes_path
    expect(page).to have_content 'Recipes'
    expect(page).to have_content 'Recipes in database: 0'
  end

  it "lists the existing recipes and their total number" do
    recipes = ["Chicken", "Potatoes", "Ham"]
    user = FactoryGirl.create(:user)
    recipes.each do |name|
      FactoryGirl.create(:recipe, name:name, user:user)
    end

    visit recipes_path

    expect(page).to have_content "Recipes in database: 3"

    recipes.each do |name|
      expect(page).to have_content name
    end
  end


  describe "User controller actions" do

    before :each do
      FactoryGirl.create(:user)

      sign_in(username:"Pekka", password:"Foobar1")
      visit new_recipe_path

      fill_in('recipe_name', with:"Amazing Stuff")
      click_button('Create Recipe')
    end


    it "can create recipes with valid name" do
      expect(Recipe.count).to eq(1)
    end

    it "cannot create recipes with invalid name" do
      visit new_recipe_path


      expect {
        click_button('Create Recipe')
      }.to change{Recipe.count}.by(0)
    end


    it "can destroy recipes" do
      visit recipe_path(1)

      expect {
        click_link('Destroy')
      }.to change{Recipe.count}.by(-1)
    end
end
end
