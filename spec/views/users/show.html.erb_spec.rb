require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :username => "Username",
      :password => "asdasd",
      :password_confirmation => "asdasd"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
  end
end
