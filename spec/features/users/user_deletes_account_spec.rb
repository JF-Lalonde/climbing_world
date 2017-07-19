require 'rails_helper'

feature "User deletes an account" do
  scenario "user as admin can delete a valid account" do
    user = User.create(username: "testing", password: "mypassword", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit users_path
    expect(page).to have_content(user.username)
    expect(page).to have_content("Delete")

    click_on("Delete", match: :first)
    expect(current_path).to eq(users_path)
    #expect(page).to_not have_content(user.username)
    expect(page).to have_content("User Deleted!")
  end
end
