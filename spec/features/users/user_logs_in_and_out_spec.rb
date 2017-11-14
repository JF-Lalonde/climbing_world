require "rails_helper"

feature "User logs in and out" do
  scenario "with valid credentials" do
    user_attributes = {
      username: "Tester",
      password: "password"
    }

    user = User.create(user_attributes)

    visit login_path
    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user_attributes[:password]

    click_button "Login"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("#{user.username}")
    expect(page).to have_content("Login Successful")

    click_on "Logout"

    expect(current_path).to eq(root_path)
    expect(page).to_not have_content("#{user.username}")
    expect(page).to have_content("Successfully Logged Out!")
  end
end
