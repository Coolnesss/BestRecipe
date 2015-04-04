require 'rails_helper'

describe "User" do

  before :each do
    user = FactoryGirl.create(:user)
    sign_in(username:"Pekka", password:"Foobar1")
  end

    it "when signed up with good credentials, is added to the system" do
      visit signup_path
      fill_in('user_username', with:'Brian')
      fill_in('user_password', with:'Secret55')
      fill_in('user_password_confirmation', with:'Secret55')
      expect{
        click_button('Create User')
      }.to change{User.count}.by(1)
    end

    it "when signed up and deleted, is destroyed" do
      visit user_path(1)

      expect {
        click_link('Destroy')
      }.to change{User.count}.by(-1)
    end

    it "when signed up and edited, is edited" do
      visit user_path(1)

      click_link('Edit')

      fill_in('user_username', with: 'Brian')

      click_button('Update User')

      expect(page).to have_content('Brian')

    end

    it "is not created with invalid name" do
      visit signup_path

      fill_in('user_username', with:'No')
      fill_in('user_password', with:'Secret55')
      fill_in('user_password_confirmation', with:'Secret55')

      expect {
        click_button('Create User')
      }.to change{User.count}.by(0)

    end

    it "can sign out" do
      Capybara.current_session.driver.delete signout_path
      expect(page.current_path).to eq('/signout')
    end

    it "cannot update user password with password mismatch" do
      visit edit_user_path(1)

      fill_in('user_password', with:"Amazing")
      fill_in('user_password_confirmation', with:"Horrible")
      expect {
        click_button('Update User')
      }.not_to change{User.first.updated_at}
    end

    it "cannot sign in with bad credentials" do
      visit signin_path
      fill_in('username', with:"Pekka")
      fill_in('password', with:"lol")
      click_button('Log in')

      expect(page).to have_content("mismatch")

    end




end
