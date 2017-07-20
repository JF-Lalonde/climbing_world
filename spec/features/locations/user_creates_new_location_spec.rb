require 'rails_helper'

feature "User creates a location" do
  scenario "a user can create a new location" do
    visit new_location_path

    fill_in "location[region]", with: "Boulder Canyon"
    fill_in "location[city]", with: "Boulder"
    fill_in "location[state]", with: "CO"
    click_button "Create"

    expect(current_path).to eq("/locations/#{Location.last.id}")
    expect(page).to have_content("Created!")
    expect(page).to have_content("Boulder Canyon")
    expect(page).to have_content("Boulder")
    expect(page).to have_content("CO")
    expect(Location.count).to eq(1)
  end
end
