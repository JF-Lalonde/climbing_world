require 'rails_helper'

feature "User creates a new account" do
  scenario "with valid attributes" do
    user_attributes = {
      username: "testing",
      password: "mypassword"
    }

    visit new_user_path
    fill_in "user[username]", with: user_attributes[:username]
    fill_in "user[password]", with: user_attributes[:password]
    fill_in "user[password_confirmation]", with: user_attributes[:password]
    click_on "Create Account"

    user = User.last

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_content("Login Successful")
  end

  scenario "with invalid attributes" do
    user_attributes = {
      username: "testing",
      password: "mypassword"
    }

    visit new_user_path
    fill_in "user[username]", with: user_attributes[:username]
    fill_in "user[password]", with: user_attributes[:password]
    fill_in "user[password_confirmation]", with: "Wrong password"
    click_on "Create Account"


    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(page).to_not have_content("Welcome")
    expect(current_path).to eq(users_path)
  end
end
