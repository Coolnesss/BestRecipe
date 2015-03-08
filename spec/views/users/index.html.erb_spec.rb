require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :username => "Username",
        :password => "asdasd",
        :password_confirmation => "asdasd"
      ),
      User.create!(
        :username => "Username2",
        :password => "asdasd",
        :password_confirmation => "asdasd"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Username".to_s, :count => 1
    assert_select "tr>td", :text => "Username2".to_s, :count => 1

  end
end
