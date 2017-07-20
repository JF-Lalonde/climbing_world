require 'rails_helper'

describe "User deletes existing route" do
  scenario "a user can delete a route" do
    location = create(:location)
    pitch = create(:pitch)
    rating = create(:rating)
    route = create(:route, location: location, pitch: pitch, rating: rating)

    visit routes_path

    first("a").click

    expect(page).to have_content("Route Removed")
    expect(page).to_not have_content("Route Name")
  end
end
