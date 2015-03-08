require 'rails_helper'

describe User do
  before(:each) do
    @user = User.create(
      :username => "Username",
      :password => "asdasd",
      :password_confirmation => "asdasd"
    )
  end

  it "has correct username" do
    expect(@user.username).to eq("Username")
  end

  it "cannot be saved with bad username" do
    User.create(username:"as", password:"legit", password_confirmation:"legit")
    expect(User.count).to eq(1)
  end
end
