require 'rails_helper'

describe "User deletes existing location" do
  scenario "a user can delete a location" do
    location = create(:location)

    visit locations_path

    first("a").click
save_and_open_page
    expect(page).to have_content("Location Removed")
    expect(page).to_not have_content("Boulder")
  end
end
