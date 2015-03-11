require 'rails_helper'

describe "Recipes update page" do

  before :each do

    recipes = ["Chicken", "Potatoes", "Ham"]
    user = FactoryGirl.create(:user)
    recipes.each do |name|
      FactoryGirl.create(:recipe, name:name, user:user)
    end

    sign_in(username:"Pekka", password:"Foobar1")

  end

  it "can update recipe name" do
    visit edit_recipe_path(1)

    fill_in('Description', with:'Amazing')

    click_button('Update Recipe')

    expect(page).to have_content('Amazing')

  end


end
