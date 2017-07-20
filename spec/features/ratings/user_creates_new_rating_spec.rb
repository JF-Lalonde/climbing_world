require 'rails_helper'

feature "User creates a rating" do
  scenario "a user can create a new rating" do
    visit new_rating_path

    fill_in "rating[number]", with: "5.12a"
    click_button "Create"

    expect(current_path).to eq("/ratings/#{Rating.last.id}")
    expect(page).to have_content("Created!")
    expect(page).to have_content("5.12a")
    expect(Rating.count).to eq(1)
  end
end
