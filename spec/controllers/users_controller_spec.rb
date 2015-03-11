require 'rails_helper'

RSpec.describe UsersController do
  describe "GET index" do
    it "assigns @users" do
      user = User.create(username:"asdasd", password:"asdasd", password_confirmation:"asdasd")
      get :index
      expect(assigns(:users)).to eq([user])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "POST users" do
    it "creates user" do
      user = User.create(username:"asdasd", password:"asdasd", password_confirmation:"asdasd")
      expect(User.count).to eq(1)
    end

    it "doesn't create bad user" do
      user = User.create(username:"a", password:"asdasd", password_confirmation:"asdasd")
      expect(User.count).to eq(0)
    end
  end

end
