require 'rails_helper'

describe "Sign in page" do

  pending 'new session is not created with false credentials' do

    Session.create(username:'nonexistent', password:'user')

    expect(session[:user_id]).to be nil
  end

end